# frozen_string_literal: true

module Nii::CLDR
  class Transforms
    def initialize(root_path)
      files  = Dir.glob(File.expand_path('*.xml', root_path)).sort
      bar    = ProgressBar.create(total: files.size)
      store  = store('.', :transforms)
      @names = store[:names] = {}
      @rules = store[:rules] = {}

      files.each do |file|
        bar.title = File.basename(file).ljust(30)
        load_xml(file)
        bar.increment
      end

      bar.finish
    end

    def store(group = :transforms, dir, name)
      @stores                     ||= {}
      @stores[[group, dir, name]] ||= Store.new(self, group, dir, name)
    end

    def load_xml(file)
      doc  = Nokogiri::XML File.open(file)
      name = File.basename(file, '.xml')
      doc.xpath('//transform').each do |transform|
        raise "#{name} no source attribute"     unless source    = transform.attr('source')
        raise "#{name} no target attribute"     unless target    = transform.attr('target')
        raise "#{name} no direction attribute"  unless direction = transform.attr('direction')
        visibility = transform.attr('visibility')
        rule       = transform.xpath('//tRule')

        raise "#{name} no tRule"       if rule.empty?
        raise "#{name} multiple tRule" if rule.size > 1

        if target =~ /FONIPA$/ or source =~ /FONIPA$/
          path = 'fonipa'
        elsif target == 'ASCII' or source == 'ASCII'
          path = 'ascii'
        elsif target == 'Latn' or (source == 'Latn' and direction == 'both')
          path = 'latn'
        else
          path = 'other'
        end

        names         = transform.attr('alias').to_s.split(' ') << name
        rules         = @rules[source] ||= {}
        rules[target] = { direction: direction, rules: clean(rule.first.text) }

        case direction
        when 'forward' then names << "#{source}-#{target}"
        when 'both'    then names << "#{source}-#{target}" << "#{target}-#{source}"
        else raise "unexpected direction #{direction}"
        end
      end
    end

    def write(uncompressed_path, compressed_path)
      @stores.each_value do |store|
        store.write(uncompressed_path, false)
        store.write(compressed_path,   true)
      end
    end

    def clean(source)
      source.gsub(/#[^\n]*/, '').gsub(/\s*\n+/, '').sub(/\s+\Z/, '')
    end

    def inspect
      "#<#{self.class}>"
    end
  end
end
