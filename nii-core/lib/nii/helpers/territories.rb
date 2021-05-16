# frozen_string_literal: true

module Nii::Helpers
  # Mixin for territory convenience methods.
  # Used by both {Nii::Context}, {Nii::Locale}, and {Nii::Territory}.
  #
  # @example Using helper methods via Context
  #   context = Nii::Context.new "de-AT"
  #   context.germany? # => false
  #   context.dach?    # => true
  #   context.eu?      # => true
  #
  # @example Including helper methods
  #   class MyApp
  #     include Nii::Helpers, Nii::Helpers::Territory
  #     attr_reader :locale
  #
  #     def initialize(locale) = @locale = locale
  #     def available? = eu? || us?
  #   end
  #
  #   MyApp.new("en-CA").available? # => false
  #   MyApp.new("en").available?    # => true
  module Territories
    # @return [true, false] whether or not the territory is Afghanistan.
    def afghanistan? = _nii_territory&.code == 'AF'

    # @return [true, false] whether or not the territory is within Africa.
    def africa? = !!_nii_territory&.within?('002')

    # @return [true, false] whether or not the territory is Åland Islands.
    def aland_islands? = _nii_territory&.code == 'AX'

    # @return [true, false] whether or not the territory is Albania.
    def albania? = _nii_territory&.code == 'AL'

    # @return [true, false] whether or not the territory is Algeria.
    def algeria? = _nii_territory&.code == 'DZ'

    # @return [true, false] whether or not the territory is American Samoa.
    def american_samoa? = _nii_territory&.code == 'AS'

    # @return [true, false] whether or not the territory is within Americas.
    def americas? = !!_nii_territory&.within?('019')

    # @return [true, false] whether or not the territory is Andorra.
    def andorra? = _nii_territory&.code == 'AD'

    # @return [true, false] whether or not the territory is Angola.
    def angola? = _nii_territory&.code == 'AO'

    # @return [true, false] whether or not the territory is Anguilla.
    def anguilla? = _nii_territory&.code == 'AI'

    # @return [true, false] whether or not the territory is Antarctica.
    def antarctica? = _nii_territory&.code == 'AQ'

    # @return [true, false] whether or not the territory is Antigua & Barbuda.
    def antigua_and_barbuda? = _nii_territory&.code == 'AG'

    # @return [true, false] whether or not the territory is Argentina.
    def argentina? = _nii_territory&.code == 'AR'

    # @return [true, false] whether or not the territory is Armenia.
    def armenia? = _nii_territory&.code == 'AM'

    # @return [true, false] whether or not the territory is Aruba.
    def aruba? = _nii_territory&.code == 'AW'

    # @return [true, false] whether or not the territory is Ascension Island.
    def ascension_island? = _nii_territory&.code == 'AC'

    # @return [true, false] whether or not the territory is within Asia.
    def asia? = !!_nii_territory&.within?('142')

    # @return [true, false] whether or not the territory is within Australasia.
    def australasia? = !!_nii_territory&.within?('053')

    # @return [true, false] whether or not the territory is Australia.
    def australia? = _nii_territory&.code == 'AU'

    # @return [true, false] whether or not the territory is Austria.
    def austria? = _nii_territory&.code == 'AT'

    # @return [true, false] whether or not the territory is Azerbaijan.
    def azerbaijan? = _nii_territory&.code == 'AZ'

    # @return [true, false] whether or not the territory is Bahamas.
    def bahamas? = _nii_territory&.code == 'BS'

    # @return [true, false] whether or not the territory is Bahrain.
    def bahrain? = _nii_territory&.code == 'BH'

    # @return [true, false] whether or not the territory is Bangladesh.
    def bangladesh? = _nii_territory&.code == 'BD'

    # @return [true, false] whether or not the territory is Barbados.
    def barbados? = _nii_territory&.code == 'BB'

    # @return [true, false] whether or not the territory is Belarus.
    def belarus? = _nii_territory&.code == 'BY'

    # @return [true, false] whether or not the territory is Belgium.
    def belgium? = _nii_territory&.code == 'BE'

    # @return [true, false] whether or not the territory is Belize.
    def belize? = _nii_territory&.code == 'BZ'

    # @return [true, false] whether or not the territory is Benin.
    def benin? = _nii_territory&.code == 'BJ'

    # @return [true, false] whether or not the territory is Bermuda.
    def bermuda? = _nii_territory&.code == 'BM'

    # @return [true, false] whether or not the territory is Bhutan.
    def bhutan? = _nii_territory&.code == 'BT'

    # @return [true, false] whether or not the territory is Bolivia.
    def bolivia? = _nii_territory&.code == 'BO'

    # @return [true, false] whether or not the territory is Bosnia & Herzegovina.
    def bosnia_and_herzegovina? = _nii_territory&.code == 'BA'
    alias_method :bosnia?, :bosnia_and_herzegovina?

    # @return [true, false] whether or not the territory is Botswana.
    def botswana? = _nii_territory&.code == 'BW'

    # @return [true, false] whether or not the territory is Bouvet Island.
    def bouvet_island? = _nii_territory&.code == 'BV'

    # @return [true, false] whether or not the territory is Brazil.
    def brazil? = _nii_territory&.code == 'BR'

    # @return [true, false] whether or not the territory is British Indian Ocean Territory.
    def british_indian_ocean_territory? = _nii_territory&.code == 'IO'

    # @return [true, false] whether or not the territory is British Virgin Islands.
    def british_virgin_islands? = _nii_territory&.code == 'VG'

    # @return [true, false] whether or not the territory is Brunei.
    def brunei? = _nii_territory&.code == 'BN'

    # @return [true, false] whether or not the territory is Bulgaria.
    def bulgaria? = _nii_territory&.code == 'BG'

    # @return [true, false] whether or not the territory is Burkina Faso.
    def burkina_faso? = _nii_territory&.code == 'BF'

    # @return [true, false] whether or not the territory is Burundi.
    def burundi? = _nii_territory&.code == 'BI'

    # @return [true, false] whether or not the territory is Cambodia.
    def cambodia? = _nii_territory&.code == 'KH'

    # @return [true, false] whether or not the territory is Cameroon.
    def cameroon? = _nii_territory&.code == 'CM'

    # @return [true, false] whether or not the territory is Canada.
    def canada? = _nii_territory&.code == 'CA'

    # @return [true, false] whether or not the territory is Canary Islands.
    def canary_islands? = _nii_territory&.code == 'IC'

    # @return [true, false] whether or not the territory is Cape Verde.
    def cape_verde? = _nii_territory&.code == 'CV'
    alias_method :cabo_verde?, :cape_verde?

    # @return [true, false] whether or not the territory is within Caribbean.
    def caribbean? = !!_nii_territory&.within?('029')

    # @return [true, false] whether or not the territory is Caribbean Netherlands.
    def caribbean_netherlands? = _nii_territory&.code == 'BQ'

    # @return [true, false] whether or not the territory is Cayman Islands.
    def cayman_islands? = _nii_territory&.code == 'KY'

    # @return [true, false] whether or not the territory is Central African Republic.
    def central_african_republic? = _nii_territory&.code == 'CF'

    # @return [true, false] whether or not the territory is within Central America.
    def central_america? = !!_nii_territory&.within?('013')

    # @return [true, false] whether or not the territory is within Central Asia.
    def central_asia? = !!_nii_territory&.within?('143')

    # @return [true, false] whether or not the territory is Ceuta & Melilla.
    def ceuta_and_melilla? = _nii_territory&.code == 'EA'

    # @return [true, false] whether or not the territory is Chad.
    def chad? = _nii_territory&.code == 'TD'

    # @return [true, false] whether or not the territory is Chile.
    def chile? = _nii_territory&.code == 'CL'

    # @param one_china [true, false, nil]
    #   Whether or not Taiwan, Hong Kong, and Macao are to be included in the definition of China.
    #   Defaults to nil (don't include Taiwan, but do include Hong Kong and Macao).
    #
    # @param include_taiwan [true, false]
    #   Whether or not to include Taiwan in China. Defaults to false unless +one_china+ is set to true.
    #
    # @param include_hong_kong [true, false]
    #   Whether or not to include Hong Kong in China. Defaults to true unless +one_china+ is set to false.
    #
    # @param include_macao [true, false]
    #   Whether or not to include Macao in China. Defaults to true unless +one_china+ is set to false.
    #
    # @return [true, false] whether or not the territory is China.
    def china?(one_china = nil, include_taiwan: !!one_china, include_hong_kong: one_china != false, include_macao: one_china != false)
      return true if include_hong_kong and hong_kong?
      return true if include_macao and macao?
      return true if include_taiwan and taiwan?
      _nii_territory&.code == 'CN'
    end

    # @return [true, false] whether or not the territory is Christmas Island.
    def christmas_island? = _nii_territory&.code == 'CX'

    # @return [true, false] whether or not the territory is Clipperton Island.
    def clipperton_island? = _nii_territory&.code == 'CP'

    # @return [true, false] whether or not the territory is Cocos (Keeling) Islands.
    def cocos_islands? = _nii_territory&.code == 'CC'
    alias_method :keeling_islands?, :cocos_islands?

    # @return [true, false] whether or not the territory is Colombia.
    def colombia? = _nii_territory&.code == 'CO'

    # @return [true, false] whether or not the territory is Comoros.
    def comoros? = _nii_territory&.code == 'KM'

    # @return [true, false] whether or not the territory is Congo - Brazzaville or Congo - Kinshasa.
    def congo? = congo_brazzaville? || congo_kinshasa?

    # @return [true, false] whether or not the territory is Congo - Brazzaville.
    def congo_brazzaville? = _nii_territory&.code == 'CG'
    alias_method :congo_republic?, :congo_brazzaville?

    # @return [true, false] whether or not the territory is Congo - Kinshasa.
    def congo_kinshasa? = _nii_territory&.code == 'CD'
    alias_method :congo_democratic_republic?, :congo_kinshasa?

    # @return [true, false] whether or not the territory is Cook Islands.
    def cook_islands? = _nii_territory&.code == 'CK'

    # @return [true, false] whether or not the territory is Costa Rica.
    def costa_rica? = _nii_territory&.code == 'CR'

    # @return [true, false] whether or not the territory is Croatia.
    def croatia? = _nii_territory&.code == 'HR'

    # @return [true, false] whether or not the territory is Cuba.
    def cuba? = _nii_territory&.code == 'CU'

    # @return [true, false] whether or not the territory is Curaçao.
    def curacao? = _nii_territory&.code == 'CW'

    # @return [true, false] whether or not the territory is Cyprus.
    def cyprus? = _nii_territory&.code == 'CY'

    # @return [true, false] whether or not the territory is Czechia.
    def czechia? = _nii_territory&.code == 'CZ'
    alias_method :czech_republic?, :czechia?

    # @return [true, false] whether or not the territory is within DACH region.
    def dach? = germany? || austria? || switzerland? || liechtenstein?

    # @return [true, false] whether or not the territory is Denmark.
    def denmark? = _nii_territory&.code == 'DK'

    # @return [true, false] whether or not the territory is Diego Garcia.
    def diego_garcia? = _nii_territory&.code == 'DG'

    # @return [true, false] whether or not the territory is Djibouti.
    def djibouti? = _nii_territory&.code == 'DJ'

    # @return [true, false] whether or not the territory is Dominica.
    def dominica? = _nii_territory&.code == 'DM'

    # @return [true, false] whether or not the territory is Dominican Republic.
    def dominican_republic? = _nii_territory&.code == 'DO'

    # @return [true, false] whether or not the territory is within Eastern Africa.
    def eastern_africa? = !!_nii_territory&.within?('014')

    # @return [true, false] whether or not the territory is within Eastern Asia.
    def eastern_asia? = !!_nii_territory&.within?('030')

    # @return [true, false] whether or not the territory is within Eastern Europe.
    def eastern_europe? = !!_nii_territory&.within?('151')

    # @return [true, false] whether or not the territory is Ecuador.
    def ecuador? = _nii_territory&.code == 'EC'

    # @return [true, false] whether or not the territory is Egypt.
    def egypt? = _nii_territory&.code == 'EG'

    # @return [true, false] whether or not the territory is El Salvador.
    def el_salvador? = _nii_territory&.code == 'SV'

    # @return [true, false] whether or not the territory is Equatorial Guinea.
    def equatorial_guinea? = _nii_territory&.code == 'GQ'

    # @return [true, false] whether or not the territory is Eritrea.
    def eritrea? = _nii_territory&.code == 'ER'

    # @return [true, false] whether or not the territory is Estonia.
    def estonia? = _nii_territory&.code == 'EE'

    # @return [true, false] whether or not the territory is Eswatini.
    def eswatini? = _nii_territory&.code == 'SZ'
    alias_method :swaziland?, :eswatini?

    # @return [true, false] whether or not the territory is Ethiopia.
    def ethiopia? = _nii_territory&.code == 'ET'

    # @return [true, false] whether or not the territory is within Europe.
    def europe? = !!_nii_territory&.within?('150')

    # @return [true, false] whether or not the territory is within European Union.
    def european_union? = !!_nii_territory&.within?('EU')
    alias_method :eu?, :european_union?

    # @return [true, false] whether or not the territory is within Eurozone.
    def eurozone? = !!_nii_territory&.within?('EZ')

    # @return [true, false] whether or not the territory is Falkland Islands.
    def falkland_islands? = _nii_territory&.code == 'FK'

    # @return [true, false] whether or not the territory is Faroe Islands.
    def faroe_islands? = _nii_territory&.code == 'FO'

    # @return [true, false] whether or not the territory is Fiji.
    def fiji? = _nii_territory&.code == 'FJ'

    # @return [true, false] whether or not the territory is Finland.
    def finland? = _nii_territory&.code == 'FI'

    # @return [true, false] whether or not the territory is France.
    def france? = _nii_territory&.code == 'FR'

    # @return [true, false] whether or not the territory is French Guiana.
    def french_guiana? = _nii_territory&.code == 'GF'

    # @return [true, false] whether or not the territory is French Polynesia.
    def french_polynesia? = _nii_territory&.code == 'PF'

    # @return [true, false] whether or not the territory is French Southern Territories.
    def french_southern_territories? = _nii_territory&.code == 'TF'

    # @return [true, false] whether or not the territory is Gabon.
    def gabon? = _nii_territory&.code == 'GA'

    # @return [true, false] whether or not the territory is Gambia.
    def gambia? = _nii_territory&.code == 'GM'

    # @return [true, false] whether or not the territory is Georgia.
    def georgia? = _nii_territory&.code == 'GE'

    # @return [true, false] whether or not the territory is Germany.
    def germany? = _nii_territory&.code == 'DE'

    # @return [true, false] whether or not the territory is Ghana.
    def ghana? = _nii_territory&.code == 'GH'

    # @return [true, false] whether or not the territory is Gibraltar.
    def gibraltar? = _nii_territory&.code == 'GI'

    # @return [true, false] whether or not the territory is Greece.
    def greece? = _nii_territory&.code == 'GR'

    # @return [true, false] whether or not the territory is Greenland.
    def greenland? = _nii_territory&.code == 'GL'

    # @return [true, false] whether or not the territory is Grenada.
    def grenada? = _nii_territory&.code == 'GD'

    # @return [true, false] whether or not the territory is Guadeloupe.
    def guadeloupe? = _nii_territory&.code == 'GP'

    # @return [true, false] whether or not the territory is Guam.
    def guam? = _nii_territory&.code == 'GU'

    # @return [true, false] whether or not the territory is Guatemala.
    def guatemala? = _nii_territory&.code == 'GT'

    # @return [true, false] whether or not the territory is Guernsey.
    def guernsey? = _nii_territory&.code == 'GG'

    # @return [true, false] whether or not the territory is Guinea.
    def guinea? = _nii_territory&.code == 'GN'

    # @return [true, false] whether or not the territory is Guinea-Bissau.
    def guinea_bissau? = _nii_territory&.code == 'GW'

    # @return [true, false] whether or not the territory is Guyana.
    def guyana? = _nii_territory&.code == 'GY'

    # @return [true, false] whether or not the territory is Haiti.
    def haiti? = _nii_territory&.code == 'HT'

    # @return [true, false] whether or not the territory is Heard & McDonald Islands.
    def heard_and_mcdonald_islands? = _nii_territory&.code == 'HM'

    # @return [true, false] whether or not the territory is Honduras.
    def honduras? = _nii_territory&.code == 'HN'

    # @return [true, false] whether or not the territory is Hong Kong SAR China.
    def hong_kong? = _nii_territory&.code == 'HK'

    # @return [true, false] whether or not the territory is Hungary.
    def hungary? = _nii_territory&.code == 'HU'

    # @return [true, false] whether or not the territory is Iceland.
    def iceland? = _nii_territory&.code == 'IS'

    # @return [true, false] whether or not the territory is India.
    def india? = _nii_territory&.code == 'IN'

    # @return [true, false] whether or not the territory is Indonesia.
    def indonesia? = _nii_territory&.code == 'ID'

    # @return [true, false] whether or not the territory is Iran.
    def iran? = _nii_territory&.code == 'IR'

    # @return [true, false] whether or not the territory is Iraq.
    def iraq? = _nii_territory&.code == 'IQ'

    # @return [true, false] whether or not the territory is Ireland.
    def ireland? = _nii_territory&.code == 'IE'

    # @return [true, false] whether or not the territory is Isle of Man.
    def isle_of_man? = _nii_territory&.code == 'IM'

    # @param include_palestine [true, false]
    #   Whether or not to include Palestine in Israel.
    # @return [true, false] whether or not the territory is Israel.
    def israel?(include_palestine = false)
      return true if include_palestine and palestine?
      _nii_territory&.code == 'IL'
    end

    # @param include_micro_states [true, false]
    #   Whether or not to include Vatican City and San Marino in Italy.
    #
    # @param include_vatican [true, false]
    #   Overrides include_micro_states for Vatican City.
    #
    # @param include_san_marino [true, false]
    #   Overrides include_micro_states for San Marino.
    #
    # @return [true, false] whether or not the territory is Italy.
    def italy?(include_micro_states = false, include_vatican: include_micro_states, include_san_marino: include_micro_states)
      return true if include_san_marino and san_marino?
      return true if include_vatican and vatican_city?
      _nii_territory&.code == 'IT'
    end

    # @return [true, false] whether or not the territory is Côte d’Ivoire.
    def ivory_coast? = _nii_territory&.code == 'CI'

    # @return [true, false] whether or not the territory is Jamaica.
    def jamaica? = _nii_territory&.code == 'JM'

    # @return [true, false] whether or not the territory is Japan.
    def japan? = _nii_territory&.code == 'JP'

    # @return [true, false] whether or not the territory is Jersey.
    def jersey? = _nii_territory&.code == 'JE'

    # @return [true, false] whether or not the territory is Jordan.
    def jordan? = _nii_territory&.code == 'JO'

    # @return [true, false] whether or not the territory is Kazakhstan.
    def kazakhstan? = _nii_territory&.code == 'KZ'

    # @return [true, false] whether or not the territory is Kenya.
    def kenya? = _nii_territory&.code == 'KE'

    # @return [true, false] whether or not the territory is Kiribati.
    def kiribati? = _nii_territory&.code == 'KI'
    
    # @return [true, false] whether or not the territory is North Korea or South Korea.
    def korea? = north_korea? || south_korea?

    # @return [true, false] whether or not the territory is Kosovo.
    def kosovo? = _nii_territory&.code == 'XK'

    # @return [true, false] whether or not the territory is Kuwait.
    def kuwait? = _nii_territory&.code == 'KW'

    # @return [true, false] whether or not the territory is Kyrgyzstan.
    def kyrgyzstan? = _nii_territory&.code == 'KG'

    # @return [true, false] whether or not the territory is Laos.
    def laos? = _nii_territory&.code == 'LA'

    # @return [true, false] whether or not the territory is within Latin America.
    def latin_america? = !!_nii_territory&.within?('419')

    # @return [true, false] whether or not the territory is Latvia.
    def latvia? = _nii_territory&.code == 'LV'

    # @return [true, false] whether or not the territory is Lebanon.
    def lebanon? = _nii_territory&.code == 'LB'

    # @return [true, false] whether or not the territory is Lesotho.
    def lesotho? = _nii_territory&.code == 'LS'

    # @return [true, false] whether or not the territory is Liberia.
    def liberia? = _nii_territory&.code == 'LR'

    # @return [true, false] whether or not the territory is Libya.
    def libya? = _nii_territory&.code == 'LY'

    # @return [true, false] whether or not the territory is Liechtenstein.
    def liechtenstein? = _nii_territory&.code == 'LI'

    # @return [true, false] whether or not the territory is Lithuania.
    def lithuania? = _nii_territory&.code == 'LT'

    # @return [true, false] whether or not the territory is Luxembourg.
    def luxembourg? = _nii_territory&.code == 'LU'

    # @return [true, false] whether or not the territory is Macao SAR China.
    def macao? = _nii_territory&.code == 'MO'

    # @return [true, false] whether or not the territory is Madagascar.
    def madagascar? = _nii_territory&.code == 'MG'

    # @return [true, false] whether or not the territory is Malawi.
    def malawi? = _nii_territory&.code == 'MW'

    # @return [true, false] whether or not the territory is Malaysia.
    def malaysia? = _nii_territory&.code == 'MY'

    # @return [true, false] whether or not the territory is Maldives.
    def maldives? = _nii_territory&.code == 'MV'

    # @return [true, false] whether or not the territory is Mali.
    def mali? = _nii_territory&.code == 'ML'

    # @return [true, false] whether or not the territory is Malta.
    def malta? = _nii_territory&.code == 'MT'

    # @return [true, false] whether or not the territory is Marshall Islands.
    def marshall_islands? = _nii_territory&.code == 'MH'

    # @return [true, false] whether or not the territory is Martinique.
    def martinique? = _nii_territory&.code == 'MQ'

    # @return [true, false] whether or not the territory is Mauritania.
    def mauritania? = _nii_territory&.code == 'MR'

    # @return [true, false] whether or not the territory is Mauritius.
    def mauritius? = _nii_territory&.code == 'MU'

    # @return [true, false] whether or not the territory is Mayotte.
    def mayotte? = _nii_territory&.code == 'YT'

    # @return [true, false] whether or not the territory is within Melanesia.
    def melanesia? = !!_nii_territory&.within?('054')

    # @return [true, false] whether or not the territory is Mexico.
    def mexico? = _nii_territory&.code == 'MX'

    # @return [true, false] whether or not the territory is Micronesia.
    def micronesia? = _nii_territory&.code == 'FM'

    # @return [true, false] whether or not the territory is within Micronesian Region.
    def micronesian_region? = !!_nii_territory&.within?('057')

    # @return [true, false] whether or not the territory is within Middle Africa.
    def middle_africa? = !!_nii_territory&.within?('017')

    # @return [true, false] whether or not the territory is Moldova.
    def moldova? = _nii_territory&.code == 'MD'

    # @return [true, false] whether or not the territory is Monaco.
    def monaco? = _nii_territory&.code == 'MC'

    # @return [true, false] whether or not the territory is Mongolia.
    def mongolia? = _nii_territory&.code == 'MN'

    # @return [true, false] whether or not the territory is Montenegro.
    def montenegro? = _nii_territory&.code == 'ME'

    # @return [true, false] whether or not the territory is Montserrat.
    def montserrat? = _nii_territory&.code == 'MS'

    # @return [true, false] whether or not the territory is Morocco.
    def morocco? = _nii_territory&.code == 'MA'

    # @return [true, false] whether or not the territory is Mozambique.
    def mozambique? = _nii_territory&.code == 'MZ'

    # @return [true, false] whether or not the territory is Myanmar (Burma).
    def myanmar? = _nii_territory&.code == 'MM'
    alias_method :burma?, :myanmar?

    # @return [true, false] whether or not the territory is Namibia.
    def namibia? = _nii_territory&.code == 'NA'

    # @return [true, false] whether or not the territory is Nauru.
    def nauru? = _nii_territory&.code == 'NR'

    # @return [true, false] whether or not the territory is Nepal.
    def nepal? = _nii_territory&.code == 'NP'

    # @return [true, false] whether or not the territory is Netherlands.
    def netherlands? = _nii_territory&.code == 'NL'

    # @return [true, false] whether or not the territory is New Caledonia.
    def new_caledonia? = _nii_territory&.code == 'NC'

    # @return [true, false] whether or not the territory is New Zealand.
    def new_zealand? = _nii_territory&.code == 'NZ'

    # @return [true, false] whether or not the territory is Nicaragua.
    def nicaragua? = _nii_territory&.code == 'NI'

    # @return [true, false] whether or not the territory is Niger.
    def niger? = _nii_territory&.code == 'NE'

    # @return [true, false] whether or not the territory is Nigeria.
    def nigeria? = _nii_territory&.code == 'NG'

    # @return [true, false] whether or not the territory is Niue.
    def niue? = _nii_territory&.code == 'NU'

    # @return [true, false] whether or not the territory is Norfolk Island.
    def norfolk_island? = _nii_territory&.code == 'NF'

    # @return [true, false] whether or not the territory is within North America.
    def north_america? = !!_nii_territory&.within?('003')

    # @return [true, false] whether or not the territory is North Korea.
    def north_korea? = _nii_territory&.code == 'KP'

    # @return [true, false] whether or not the territory is North Macedonia.
    def north_macedonia? = _nii_territory&.code == 'MK'
    alias_method :macedonia?, :north_macedonia?

    # @return [true, false] whether or not the territory is within Northern Africa.
    def northern_africa? = !!_nii_territory&.within?('015')

    # @return [true, false] whether or not the territory is within Northern America.
    def northern_america? = !!_nii_territory&.within?('021')

    # @return [true, false] whether or not the territory is within Northern Europe.
    def northern_europe? = !!_nii_territory&.within?('154')

    # @return [true, false] whether or not the territory is Northern Mariana Islands.
    def northern_mariana_islands? = _nii_territory&.code == 'MP'

    # @return [true, false] whether or not the territory is Norway.
    def norway? = _nii_territory&.code == 'NO'

    # @return [true, false] whether or not the territory is within Oceania.
    def oceania? = !!_nii_territory&.within?('009')

    # @return [true, false] whether or not the territory is Oman.
    def oman? = _nii_territory&.code == 'OM'

    # @return [true, false] whether or not the territory is within Outlying Oceania.
    def outlying_oceania? = !!_nii_territory&.within?('QO')

    # @return [true, false] whether or not the territory is Pakistan.
    def pakistan? = _nii_territory&.code == 'PK'

    # @return [true, false] whether or not the territory is Palau.
    def palau? = _nii_territory&.code == 'PW'

    # @return [true, false] whether or not the territory is Palestinian Territories.
    def palestine? = _nii_territory&.code == 'PS'
    alias_method :palestinian_territories?, :palestine?

    # @return [true, false] whether or not the territory is Panama.
    def panama? = _nii_territory&.code == 'PA'

    # @return [true, false] whether or not the territory is Papua New Guinea.
    def papua_new_guinea? = _nii_territory&.code == 'PG'

    # @return [true, false] whether or not the territory is Paraguay.
    def paraguay? = _nii_territory&.code == 'PY'

    # @return [true, false] whether or not the territory is Peru.
    def peru? = _nii_territory&.code == 'PE'

    # @return [true, false] whether or not the territory is Philippines.
    def philippines? = _nii_territory&.code == 'PH'

    # @return [true, false] whether or not the territory is Pitcairn Islands.
    def pitcairn_islands? = _nii_territory&.code == 'PN'

    # @return [true, false] whether or not the territory is Poland.
    def poland? = _nii_territory&.code == 'PL'

    # @return [true, false] whether or not the territory is within Polynesia.
    def polynesia? = !!_nii_territory&.within?('061')

    # @return [true, false] whether or not the territory is Portugal.
    def portugal? = _nii_territory&.code == 'PT'

    # @return [true, false] whether or not the territory is Qatar.
    def qatar? = _nii_territory&.code == 'QA'

    # @return [true, false] whether or not the territory is Réunion.
    def reunion? = _nii_territory&.code == 'RE'

    # @return [true, false] whether or not the territory is Romania.
    def romania? = _nii_territory&.code == 'RO'

    # @return [true, false] whether or not the territory is Russia.
    def russia? = _nii_territory&.code == 'RU'

    # @return [true, false] whether or not the territory is Rwanda.
    def rwanda? = _nii_territory&.code == 'RW'

    # @return [true, false] whether or not the territory is Samoa.
    def samoa? = _nii_territory&.code == 'WS'

    # @return [true, false] whether or not the territory is San Marino.
    def san_marino? = _nii_territory&.code == 'SM'

    # @return [true, false] whether or not the territory is São Tomé & Príncipe.
    def sao_tome_and_principe? = _nii_territory&.code == 'ST'
    alias_method :sao_tome?, :sao_tome_and_principe?

    # @return [true, false] whether or not the territory is Saudi Arabia.
    def saudi_arabia? = _nii_territory&.code == 'SA'

    # @return [true, false] whether or not the territory is Senegal.
    def senegal? = _nii_territory&.code == 'SN'

    # @return [true, false] whether or not the territory is Serbia.
    def serbia? = _nii_territory&.code == 'RS'

    # @return [true, false] whether or not the territory is Seychelles.
    def seychelles? = _nii_territory&.code == 'SC'

    # @return [true, false] whether or not the territory is Sierra Leone.
    def sierra_leone? = _nii_territory&.code == 'SL'

    # @return [true, false] whether or not the territory is Singapore.
    def singapore? = _nii_territory&.code == 'SG'

    # @return [true, false] whether or not the territory is Sint Maarten.
    def sint_maarten? = _nii_territory&.code == 'SX'

    # @return [true, false] whether or not the territory is Slovakia.
    def slovakia? = _nii_territory&.code == 'SK'

    # @return [true, false] whether or not the territory is Slovenia.
    def slovenia? = _nii_territory&.code == 'SI'

    # @return [true, false] whether or not the territory is Solomon Islands.
    def solomon_islands? = _nii_territory&.code == 'SB'

    # @return [true, false] whether or not the territory is Somalia.
    def somalia? = _nii_territory&.code == 'SO'

    # @return [true, false] whether or not the territory is South Africa.
    def south_africa? = _nii_territory&.code == 'ZA'

    # @return [true, false] whether or not the territory is within South America.
    def south_america? = !!_nii_territory&.within?('005')

    # @return [true, false] whether or not the territory is South Georgia & South Sandwich Islands.
    def south_georgia_and_south_sandwich_islands? = _nii_territory&.code == 'GS'
    alias_method :sout_georgia?, :south_georgia_and_south_sandwich_islands?

    # @return [true, false] whether or not the territory is South Korea.
    def south_korea? = _nii_territory&.code == 'KR'

    # @return [true, false] whether or not the territory is South Sudan.
    def south_sudan? = _nii_territory&.code == 'SS'

    # @return [true, false] whether or not the territory is within Southeast Asia.
    def southeast_asia? = !!_nii_territory&.within?('035')

    # @return [true, false] whether or not the territory is within Southern Africa.
    def southern_africa? = !!_nii_territory&.within?('018')

    # @return [true, false] whether or not the territory is within Southern Asia.
    def southern_asia? = !!_nii_territory&.within?('034')

    # @return [true, false] whether or not the territory is within Southern Europe.
    def southern_europe? = !!_nii_territory&.within?('039')

    # @return [true, false] whether or not the territory is Spain.
    def spain? = _nii_territory&.code == 'ES'

    # @return [true, false] whether or not the territory is Sri Lanka.
    def sri_lanka? = _nii_territory&.code == 'LK'

    # @return [true, false] whether or not the territory is St. Barthélemy.
    def st_barthelemy? = _nii_territory&.code == 'BL'

    # @return [true, false] whether or not the territory is St. Helena.
    def st_helena? = _nii_territory&.code == 'SH'

    # @return [true, false] whether or not the territory is St. Kitts & Nevis.
    def st_kitts_and_nevis? = _nii_territory&.code == 'KN'

    # @return [true, false] whether or not the territory is St. Lucia.
    def st_lucia? = _nii_territory&.code == 'LC'

    # @return [true, false] whether or not the territory is St. Martin.
    def st_martin? = _nii_territory&.code == 'MF'

    # @return [true, false] whether or not the territory is St. Pierre & Miquelon.
    def st_pierre_and_miquelon? = _nii_territory&.code == 'PM'

    # @return [true, false] whether or not the territory is St. Vincent & Grenadines.
    def st_vincent_and_grenadines? = _nii_territory&.code == 'VC'

    # @return [true, false] whether or not the territory is within Sub-Saharan Africa.
    def sub_saharan_africa? = !!_nii_territory&.within?('202')

    # @return [true, false] whether or not the territory is Sudan.
    def sudan? = _nii_territory&.code == 'SD'

    # @return [true, false] whether or not the territory is Suriname.
    def suriname? = _nii_territory&.code == 'SR'

    # @return [true, false] whether or not the territory is Svalbard & Jan Mayen.
    def svalbard_and_jan_mayen? = _nii_territory&.code == 'SJ'
    alias_method :svalbard?, :svalbard_and_jan_mayen?

    # @return [true, false] whether or not the territory is Sweden.
    def sweden? = _nii_territory&.code == 'SE'

    # @return [true, false] whether or not the territory is Switzerland.
    def switzerland? = _nii_territory&.code == 'CH'

    # @return [true, false] whether or not the territory is Syria.
    def syria? = _nii_territory&.code == 'SY'

    # @return [true, false] whether or not the territory is Taiwan.
    def taiwan? = _nii_territory&.code == 'TW'
    alias_method :roc?, :taiwan?

    # @return [true, false] whether or not the territory is Tajikistan.
    def tajikistan? = _nii_territory&.code == 'TJ'

    # @return [true, false] whether or not the territory is Tanzania.
    def tanzania? = _nii_territory&.code == 'TZ'

    # @return [true, false] whether or not the territory is Thailand.
    def thailand? = _nii_territory&.code == 'TH'

    # @return [true, false] whether or not the territory is Timor-Leste.
    def timor_leste? = _nii_territory&.code == 'TL'
    alias_method :east_timor?, :timor_leste?

    # @return [true, false] whether or not the territory is Togo.
    def togo? = _nii_territory&.code == 'TG'

    # @return [true, false] whether or not the territory is Tokelau.
    def tokelau? = _nii_territory&.code == 'TK'

    # @return [true, false] whether or not the territory is Tonga.
    def tonga? = _nii_territory&.code == 'TO'

    # @return [true, false] whether or not the territory is Trinidad & Tobago.
    def trinidad_and_tobago? = _nii_territory&.code == 'TT'

    # @return [true, false] whether or not the territory is Tristan da Cunha.
    def tristan_da_cunha? = _nii_territory&.code == 'TA'

    # @return [true, false] whether or not the territory is Tunisia.
    def tunisia? = _nii_territory&.code == 'TN'

    # @return [true, false] whether or not the territory is Turkey.
    def turkey? = _nii_territory&.code == 'TR'

    # @return [true, false] whether or not the territory is Turkmenistan.
    def turkmenistan? = _nii_territory&.code == 'TM'

    # @return [true, false] whether or not the territory is Turks & Caicos Islands.
    def turks_and_caicos_islands? = _nii_territory&.code == 'TC'

    # @return [true, false] whether or not the territory is Tuvalu.
    def tuvalu? = _nii_territory&.code == 'TV'

    # @return [true, false] whether or not the territory is Uganda.
    def uganda? = _nii_territory&.code == 'UG'

    # @return [true, false] whether or not the territory is Ukraine.
    def ukraine? = _nii_territory&.code == 'UA'

    # @return [true, false] whether or not the territory is United Arab Emirates.
    def united_arab_emirates? = _nii_territory&.code == 'AE'

    # @return [true, false] whether or not the territory is United Kingdom.
    def united_kingdom? = _nii_territory&.code == 'GB'
    alias_method :uk?,           :united_kingdom?
    alias_method :great_britain, :united_kingdom?

    # @return [true, false] whether or not the territory is within United Nations.
    def united_nations? = !!_nii_territory&.within?('UN')
    alias_method :un?, :united_nations?

    # @return [true, false] whether or not the territory is United States.
    def united_states? = _nii_territory&.code == 'US'
    alias_method :us?, :united_states?

    # @return [true, false] whether or not the territory is Unknown Region.
    def unknown_region? = _nii_territory.nil? || _nii_territory&.code == 'ZZ'

    # @return [true, false] whether or not the territory is Uruguay.
    def uruguay? = _nii_territory&.code == 'UY'

    # @return [true, false] whether or not the territory is U.S. Outlying Islands.
    def us_outlying_islands? = _nii_territory&.code == 'UM'

    # @return [true, false] whether or not the territory is U.S. Virgin Islands.
    def us_virgin_islands? = _nii_territory&.code == 'VI'

    # @return [true, false] whether or not the territory is Uzbekistan.
    def uzbekistan? = _nii_territory&.code == 'UZ'

    # @return [true, false] whether or not the territory is Vanuatu.
    def vanuatu? = _nii_territory&.code == 'VU'

    # @return [true, false] whether or not the territory is Vatican City.
    def vatican_city? = _nii_territory&.code == 'VA'
    alias_method :vatican?, :vatican_city?

    # @return [true, false] whether or not the territory is Venezuela.
    def venezuela? = _nii_territory&.code == 'VE'

    # @return [true, false] whether or not the territory is Vietnam.
    def vietnam? = _nii_territory&.code == 'VN'

    # @return [true, false] whether or not the territory is Wallis & Futuna.
    def wallis_and_futuna? = _nii_territory&.code == 'WF'

    # @return [true, false] whether or not the territory is within Western Africa.
    def western_africa? = !!_nii_territory&.within?('011')

    # @return [true, false] whether or not the territory is within Western Asia.
    def western_asia? = !!_nii_territory&.within?('145')

    # @return [true, false] whether or not the territory is within Western Europe.
    def western_europe? = !!_nii_territory&.within?('155')

    # @return [true, false] whether or not the territory is Western Sahara.
    def western_sahara? = _nii_territory&.code == 'EH'

    # @return [true, false] whether or not the territory is Yemen.
    def yemen? = _nii_territory&.code == 'YE'

    # @return [true, false] whether or not the territory is Zambia.
    def zambia? = _nii_territory&.code == 'ZM'

    # @return [true, false] whether or not the territory is Zimbabwe.
    def zimbabwe? = _nii_territory&.code == 'ZW'

    private

    def _nii_territory(base = self)
      case base
      when Nii::Territory then base
      when Nii::Context   then base.territory
      when Nii::Helpers   then base.nii(false)&.territory
      when Nii::Locale    then base.territory ? Nii::Territory.new(base.territory) : nil
      else
        return _nii_territory(base.to_nii_territory) if base.respond_to? :to_nii_territory
        return _nii_territory(base.to_nii_context)   if base.respond_to? :to_nii_context
        return _nii_territory(base.to_nii_locale)    if base.respond_to? :to_nii_locale
      end
    end
  end
end
