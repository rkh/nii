# frozen_string_literal: true

module Nii::Helpers
  # Mixin for territory convenience methods.
  # Used by both {Nii::Context} and {Nii::Locale}.
  #
  # @example Using helper methods via Context
  #   context = Nii::Context.new "de-AT"
  #   context.german? # => true
  #
  # @example Including helper methods
  #   class MyApp
  #     include Nii::Helpers, Nii::Helpers::Languages
  #     attr_reader :locale
  #     def initialize(locale) = @locale = locale
  #   end
  #
  #   MyApp.new("en-CA").english? # => true
  module Languages
    # @return [true, false] whether or not the language is Abkhazian.
    def abkhazian? = _nii_locale&.subset_of?('ab')

    # @return [true, false] whether or not the language is Achinese.
    def achinese? = _nii_locale&.subset_of?('ace')
    alias_method :acehnese?, :achinese?

    # @return [true, false] whether or not the language is Acoli.
    def acoli? = _nii_locale&.subset_of?('ach')

    # @return [true, false] whether or not the language is Adangme.
    def adangme? = _nii_locale&.subset_of?('ada')

    # @return [true, false] whether or not the language is Adyghe.
    def adyghe? = _nii_locale&.subset_of?('ady')

    # @return [true, false] whether or not the language is Afar.
    def afar? = _nii_locale&.subset_of?('aa')

    # @return [true, false] whether or not the language is Afrihili.
    def afrihili? = _nii_locale&.subset_of?('afh')

    # @return [true, false] whether or not the language is Afrikaans.
    def afrikaans? = _nii_locale&.subset_of?('af')

    # @return [true, false] whether or not the language is Aghem.
    def aghem? = _nii_locale&.subset_of?('agq')

    # @return [true, false] whether or not the language is Ainu.
    def ainu? = _nii_locale&.subset_of?('ain')

    # @return [true, false] whether or not the language is Akan.
    def akan? = _nii_locale&.subset_of?('ak')

    # @return [true, false] whether or not the language is Akkadian.
    def akkadian? = _nii_locale&.subset_of?('akk')

    # @return [true, false] whether or not the language is Akoose.
    def akoose? = _nii_locale&.subset_of?('bss')

    # @return [true, false] whether or not the language is Alabama.
    def alabama? = _nii_locale&.subset_of?('akz')

    # @return [true, false] whether or not the language is Albanian.
    def albanian? = _nii_locale&.subset_of?('sq')

    # @return [true, false] whether or not the language is Aleut.
    def aleut? = _nii_locale&.subset_of?('ale')

    # @return [true, false] whether or not the language is Algerian Arabic.
    def algerian_arabic? = _nii_locale&.subset_of?('arq')

    # @return [true, false] whether or not the language is American English.
    def american_english? = _nii_locale&.subset_of?('en-US')
    alias_method :us_english?, :american_english?

    # @return [true, false] whether or not the language is American Sign Language.
    def american_sign_language? = _nii_locale&.subset_of?('ase')

    # @return [true, false] whether or not the language is Amharic.
    def amharic? = _nii_locale&.subset_of?('am')

    # @return [true, false] whether or not the language is Ancient Egyptian.
    def ancient_egyptian? = _nii_locale&.subset_of?('egy')

    # @return [true, false] whether or not the language is Ancient Greek.
    def ancient_greek? = _nii_locale&.subset_of?('grc')

    # @return [true, false] whether or not the language is Angika.
    def angika? = _nii_locale&.subset_of?('anp')

    # @return [true, false] whether or not the language is Ao Naga.
    def ao_naga? = _nii_locale&.subset_of?('njo')

    # @return [true, false] whether or not the language is Arabic.
    def arabic?(strict = false)
      return true  if _nii_locale&.subset_of?('ar')
      return false if strict
      algerian_arabic? || chadian_arabic? || egyptian_arabic? || judeo_arabic? ||
      moroccan_arabic? || najdi_arabic?   || tunisian_arabic?
    end

    # @return [true, false] whether or not the language is Aragonese.
    def aragonese? = _nii_locale&.subset_of?('an')

    # @return [true, false] whether or not the language is Aramaic.
    def aramaic? = _nii_locale&.subset_of?('arc')

    # @return [true, false] whether or not the language is Araona.
    def araona? = _nii_locale&.subset_of?('aro')

    # @return [true, false] whether or not the language is Arapaho.
    def arapaho? = _nii_locale&.subset_of?('arp')

    # @return [true, false] whether or not the language is Arawak.
    def arawak? = _nii_locale&.subset_of?('arw')

    # @return [true, false] whether or not the language is Armenian.
    def armenian? = _nii_locale&.subset_of?('hy')

    # @return [true, false] whether or not the language is Aromanian.
    def aromanian? = _nii_locale&.subset_of?('rup')

    # @return [true, false] whether or not the language is Arpitan.
    def arpitan? = _nii_locale&.subset_of?('frp')

    # @return [true, false] whether or not the language is Assamese.
    def assamese? = _nii_locale&.subset_of?('as')

    # @return [true, false] whether or not the language is Asturian.
    def asturian? = _nii_locale&.subset_of?('ast')

    # @return [true, false] whether or not the language is Asu.
    def asu? = _nii_locale&.subset_of?('asa')

    # @return [true, false] whether or not the language is Atsam.
    def atsam? = _nii_locale&.subset_of?('cch')

    # @return [true, false] whether or not the language is Australian English.
    def australian_english? = _nii_locale&.subset_of?('en-AU')

    # @return [true, false] whether or not the language is Austrian German.
    def austrian_german? = _nii_locale&.subset_of?('de-AT')

    # @return [true, false] whether or not the language is Avaric.
    def avaric? = _nii_locale&.subset_of?('av')

    # @return [true, false] whether or not the language is Avestan.
    def avestan? = _nii_locale&.subset_of?('ae')

    # @return [true, false] whether or not the language is Awadhi.
    def awadhi? = _nii_locale&.subset_of?('awa')

    # @return [true, false] whether or not the language is Aymara.
    def aymara? = _nii_locale&.subset_of?('ay')

    # @return [true, false] whether or not the language is Azerbaijani.
    def azerbaijani? = _nii_locale&.subset_of?('az')
    alias_method :azeri?, :azerbaijani?

    # @return [true, false] whether or not the language is Badaga.
    def badaga? = _nii_locale&.subset_of?('bfq')

    # @return [true, false] whether or not the language is Bafia.
    def bafia? = _nii_locale&.subset_of?('ksf')

    # @return [true, false] whether or not the language is Bafut.
    def bafut? = _nii_locale&.subset_of?('bfd')

    # @return [true, false] whether or not the language is Bakhtiari.
    def bakhtiari? = _nii_locale&.subset_of?('bqi')

    # @return [true, false] whether or not the language is Balinese.
    def balinese? = _nii_locale&.subset_of?('ban')

    # @return [true, false] whether or not the language is Baluchi.
    def baluchi? = _nii_locale&.subset_of?('bal')

    # @return [true, false] whether or not the language is Bambara.
    def bambara? = _nii_locale&.subset_of?('bm')

    # @return [true, false] whether or not the language is Bamun.
    def bamun? = _nii_locale&.subset_of?('bax')

    # @return [true, false] whether or not the language is Bangla.
    def bangla? = _nii_locale&.subset_of?('bn')

    # @return [true, false] whether or not the language is Banjar.
    def banjar? = _nii_locale&.subset_of?('bjn')

    # @return [true, false] whether or not the language is Basaa.
    def basaa? = _nii_locale&.subset_of?('bas')

    # @return [true, false] whether or not the language is Bashkir.
    def bashkir? = _nii_locale&.subset_of?('ba')

    # @return [true, false] whether or not the language is Basque.
    def basque? = _nii_locale&.subset_of?('eu')

    # @return [true, false] whether or not the language is Batak Toba.
    def batak_toba? = _nii_locale&.subset_of?('bbc')

    # @return [true, false] whether or not the language is Bavarian.
    def bavarian? = _nii_locale&.subset_of?('bar')

    # @return [true, false] whether or not the language is Beja.
    def beja? = _nii_locale&.subset_of?('bej')

    # @return [true, false] whether or not the language is Belarusian.
    def belarusian? = _nii_locale&.subset_of?('be')

    # @return [true, false] whether or not the language is Bemba.
    def bemba? = _nii_locale&.subset_of?('bem')

    # @return [true, false] whether or not the language is Bena.
    def bena? = _nii_locale&.subset_of?('bez')

    # @return [true, false] whether or not the language is Betawi.
    def betawi? = _nii_locale&.subset_of?('bew')

    # @return [true, false] whether or not the language is Bhojpuri.
    def bhojpuri? = _nii_locale&.subset_of?('bho')

    # @return [true, false] whether or not the language is Bikol.
    def bikol? = _nii_locale&.subset_of?('bik')

    # @return [true, false] whether or not the language is Bini.
    def bini? = _nii_locale&.subset_of?('bin')

    # @return [true, false] whether or not the language is Bishnupriya.
    def bishnupriya? = _nii_locale&.subset_of?('bpy')

    # @return [true, false] whether or not the language is Bislama.
    def bislama? = _nii_locale&.subset_of?('bi')

    # @return [true, false] whether or not the language is Blin.
    def blin? = _nii_locale&.subset_of?('byn')

    # @return [true, false] whether or not the language is Blissymbols.
    def blissymbols? = _nii_locale&.subset_of?('zbl')

    # @return [true, false] whether or not the language is Bodo.
    def bodo? = _nii_locale&.subset_of?('brx')

    # @return [true, false] whether or not the language is Bosnian.
    def bosnian? = _nii_locale&.subset_of?('bs')

    # @return [true, false] whether or not the language is Brahui.
    def brahui? = _nii_locale&.subset_of?('brh')

    # @return [true, false] whether or not the language is Braj.
    def braj? = _nii_locale&.subset_of?('bra')

    # @return [true, false] whether or not the language is Brazilian Portuguese.
    def brazilian_portuguese? = _nii_locale&.subset_of?('pt-BR')

    # @return [true, false] whether or not the language is Breton.
    def breton? = _nii_locale&.subset_of?('br')

    # @return [true, false] whether or not the language is British English.
    def british_english? = _nii_locale&.subset_of?('en-GB')
    alias_method :uk_english?, :british_english?

    # @return [true, false] whether or not the language is Buginese.
    def buginese? = _nii_locale&.subset_of?('bug')

    # @return [true, false] whether or not the language is Bulgarian.
    def bulgarian? = _nii_locale&.subset_of?('bg')

    # @return [true, false] whether or not the language is Bulu.
    def bulu? = _nii_locale&.subset_of?('bum')

    # @return [true, false] whether or not the language is Buriat.
    def buriat? = _nii_locale&.subset_of?('bua')

    # @return [true, false] whether or not the language is Burmese.
    def burmese? = _nii_locale&.subset_of?('my')
    alias_method :myanmar_language?, :burmese?

    # @return [true, false] whether or not the language is Caddo.
    def caddo? = _nii_locale&.subset_of?('cad')

    # @return [true, false] whether or not the language is Cajun French.
    def cajun_french? = _nii_locale&.subset_of?('frc')

    # @return [true, false] whether or not the language is Canadian English.
    def canadian_english? = _nii_locale&.subset_of?('en-CA')

    # @return [true, false] whether or not the language is Canadian French.
    def canadian_french? = _nii_locale&.subset_of?('fr-CA')

    # @return [true, false] whether or not the language is Cantonese.
    def cantonese? = _nii_locale&.subset_of?('yue')

    # @return [true, false] whether or not the language is Capiznon.
    def capiznon? = _nii_locale&.subset_of?('cps')

    # @return [true, false] whether or not the language is Carib.
    def carib? = _nii_locale&.subset_of?('car')

    # @return [true, false] whether or not the language is Catalan.
    def catalan? = _nii_locale&.subset_of?('ca')

    # @return [true, false] whether or not the language is Cayuga.
    def cayuga? = _nii_locale&.subset_of?('cay')

    # @return [true, false] whether or not the language is Cebuano.
    def cebuano? = _nii_locale&.subset_of?('ceb')

    # @return [true, false] whether or not the language is Central Atlas Tamazight.
    def central_atlas_tamazight? = _nii_locale&.subset_of?('tzm')

    # @return [true, false] whether or not the language is Central Dusun.
    def central_dusun? = _nii_locale&.subset_of?('dtp')

    # @return [true, false] whether or not the language is Central Kurdish.
    def central_kurdish? = _nii_locale&.subset_of?('ckb')

    # @return [true, false] whether or not the language is Central Yupik.
    def central_yupik? = _nii_locale&.subset_of?('esu')

    # @return [true, false] whether or not the language is Chadian Arabic.
    def chadian_arabic? = _nii_locale&.subset_of?('shu')

    # @return [true, false] whether or not the language is Chagatai.
    def chagatai? = _nii_locale&.subset_of?('chg')

    # @return [true, false] whether or not the language is Chakma.
    def chakma? = _nii_locale&.subset_of?('ccp')

    # @return [true, false] whether or not the language is Chamorro.
    def chamorro? = _nii_locale&.subset_of?('ch')

    # @return [true, false] whether or not the language is Chechen.
    def chechen? = _nii_locale&.subset_of?('ce')

    # @return [true, false] whether or not the language is Cherokee.
    def cherokee? = _nii_locale&.subset_of?('chr')

    # @return [true, false] whether or not the language is Cheyenne.
    def cheyenne? = _nii_locale&.subset_of?('chy')

    # @return [true, false] whether or not the language is Chibcha.
    def chibcha? = _nii_locale&.subset_of?('chb')

    # @return [true, false] whether or not the language is Chickasaw.
    def chickasaw? = _nii_locale&.subset_of?('cic')

    # @return [true, false] whether or not the language is Chiga.
    def chiga? = _nii_locale&.subset_of?('cgg')

    # @return [true, false] whether or not the language is Chimborazo Highland Quichua.
    def chimborazo_highland_quichua? = _nii_locale&.subset_of?('qug')

    # @return [true, false] whether or not the language is Chinese.
    def chinese?(strict = false)
      return mandarin_chinese? if strict
      mandarin_chinese? || cantonese?       || gan_chinese? || hakka_chinese? ||
      literary_chinese? || min_nan_chinese? || wu_chinese?  || xiang_chinese? ||
      sichuan_yi?
    end

    # @return [true, false] whether or not the language is Chinook Jargon.
    def chinook_jargon? = _nii_locale&.subset_of?('chn')

    # @return [true, false] whether or not the language is Chipewyan.
    def chipewyan? = _nii_locale&.subset_of?('chp')

    # @return [true, false] whether or not the language is Choctaw.
    def choctaw? = _nii_locale&.subset_of?('cho')

    # @return [true, false] whether or not the language is Church Slavic.
    def church_slavic? = _nii_locale&.subset_of?('cu')

    # @return [true, false] whether or not the language is Chuukese.
    def chuukese? = _nii_locale&.subset_of?('chk')

    # @return [true, false] whether or not the language is Chuvash.
    def chuvash? = _nii_locale&.subset_of?('cv')

    # @return [true, false] whether or not the language is Classical Newari.
    def classical_newari? = _nii_locale&.subset_of?('nwc')

    # @return [true, false] whether or not the language is Classical Syriac.
    def classical_syriac? = _nii_locale&.subset_of?('syc')

    # @return [true, false] whether or not the language is Colognian.
    def colognian? = _nii_locale&.subset_of?('ksh')

    # @return [true, false] whether or not the language is Comorian.
    def comorian? = _nii_locale&.subset_of?('swb')

    # @return [true, false] whether or not the language is Congo Swahili.
    def congo_swahili? = _nii_locale&.subset_of?('sw-CD')

    # @return [true, false] whether or not the language is Coptic.
    def coptic? = _nii_locale&.subset_of?('cop')

    # @return [true, false] whether or not the language is Cornish.
    def cornish? = _nii_locale&.subset_of?('kw')

    # @return [true, false] whether or not the language is Corsican.
    def corsican? = _nii_locale&.subset_of?('co')

    # @return [true, false] whether or not the language is Cree.
    def cree? = _nii_locale&.subset_of?('cr')

    # @return [true, false] whether or not the language is Crimean Turkish.
    def crimean_turkish? = _nii_locale&.subset_of?('crh')

    # @return [true, false] whether or not the language is Croatian.
    def croatian? = _nii_locale&.subset_of?('hr')

    # @return [true, false] whether or not the language is Czech.
    def czech? = _nii_locale&.subset_of?('cs')

    # @return [true, false] whether or not the language is Dakota.
    def dakota? = _nii_locale&.subset_of?('dak')

    # @return [true, false] whether or not the language is Danish.
    def danish? = _nii_locale&.subset_of?('da')

    # @return [true, false] whether or not the language is Dargwa.
    def dargwa? = _nii_locale&.subset_of?('dar')

    # @return [true, false] whether or not the language is Dari.
    def dari? = _nii_locale&.subset_of?('fa-AF')

    # @return [true, false] whether or not the language is Dazaga.
    def dazaga? = _nii_locale&.subset_of?('dzg')

    # @return [true, false] whether or not the language is Delaware.
    def delaware? = _nii_locale&.subset_of?('del')

    # @return [true, false] whether or not the language is Dinka.
    def dinka? = _nii_locale&.subset_of?('din')

    # @return [true, false] whether or not the language is Divehi.
    def divehi? = _nii_locale&.subset_of?('dv')

    # @return [true, false] whether or not the language is Dogri.
    def dogri? = _nii_locale&.subset_of?('doi')

    # @return [true, false] whether or not the language is Dogrib.
    def dogrib? = _nii_locale&.subset_of?('dgr')

    # @return [true, false] whether or not the language is Duala.
    def duala? = _nii_locale&.subset_of?('dua')

    # @return [true, false] whether or not the language is Dutch.
    def dutch? = _nii_locale&.subset_of?('nl')

    # @return [true, false] whether or not the language is Dyula.
    def dyula? = _nii_locale&.subset_of?('dyu')

    # @return [true, false] whether or not the language is Dzongkha.
    def dzongkha? = _nii_locale&.subset_of?('dz')

    # @return [true, false] whether or not the language is Eastern Frisian.
    def eastern_frisian? = _nii_locale&.subset_of?('frs')

    # @return [true, false] whether or not the language is Efik.
    def efik? = _nii_locale&.subset_of?('efi')

    # @return [true, false] whether or not the language is Egyptian Arabic.
    def egyptian_arabic? = _nii_locale&.subset_of?('arz')

    # @return [true, false] whether or not the language is Ekajuk.
    def ekajuk? = _nii_locale&.subset_of?('eka')

    # @return [true, false] whether or not the language is Elamite.
    def elamite? = _nii_locale&.subset_of?('elx')

    # @return [true, false] whether or not the language is Embu.
    def embu? = _nii_locale&.subset_of?('ebu')

    # @return [true, false] whether or not the language is Emilian.
    def emilian? = _nii_locale&.subset_of?('egl')

    # @return [true, false] whether or not the language is English.
    def english? = _nii_locale&.subset_of?('en')

    # @return [true, false] whether or not the language is Erzya.
    def erzya? = _nii_locale&.subset_of?('myv')

    # @return [true, false] whether or not the language is Esperanto.
    def esperanto? = _nii_locale&.subset_of?('eo')

    # @return [true, false] whether or not the language is Estonian.
    def estonian? = _nii_locale&.subset_of?('et')

    # @return [true, false] whether or not the language is European Portuguese.
    def european_portuguese? = _nii_locale&.subset_of?('pt-PT')

    # @return [true, false] whether or not the language is European Spanish.
    def european_spanish? = _nii_locale&.subset_of?('es-ES')

    # @return [true, false] whether or not the language is Ewe.
    def ewe? = _nii_locale&.subset_of?('ee')

    # @return [true, false] whether or not the language is Ewondo.
    def ewondo? = _nii_locale&.subset_of?('ewo')

    # @return [true, false] whether or not the language is Extremaduran.
    def extremaduran? = _nii_locale&.subset_of?('ext')

    # @return [true, false] whether or not the language is Fang.
    def fang? = _nii_locale&.subset_of?('fan')

    # @return [true, false] whether or not the language is Fanti.
    def fanti? = _nii_locale&.subset_of?('fat')

    # @return [true, false] whether or not the language is Faroese.
    def faroese? = _nii_locale&.subset_of?('fo')

    # @return [true, false] whether or not the language is Fiji Hindi.
    def fiji_hindi? = _nii_locale&.subset_of?('hif')

    # @return [true, false] whether or not the language is Fijian.
    def fijian? = _nii_locale&.subset_of?('fj')

    # @return [true, false] whether or not the language is Filipino.
    def filipino? = _nii_locale&.subset_of?('fil')

    # @return [true, false] whether or not the language is Finnish.
    def finnish? = _nii_locale&.subset_of?('fi')

    # @return [true, false] whether or not the language is Flemish.
    def flemish? = _nii_locale&.subset_of?('nl-BE')

    # @return [true, false] whether or not the language is Fon.
    def fon? = _nii_locale&.subset_of?('fon')

    # @return [true, false] whether or not the language is Frafra.
    def frafra? = _nii_locale&.subset_of?('gur')

    # @return [true, false] whether or not the language is French.
    def french? = _nii_locale&.subset_of?('fr')

    # @return [true, false] whether or not the language is Friulian.
    def friulian? = _nii_locale&.subset_of?('fur')

    # @return [true, false] whether or not the language is Fulah.
    def fulah? = _nii_locale&.subset_of?('ff')

    # @return [true, false] whether or not the language is Ga.
    def ga? = _nii_locale&.subset_of?('gaa')

    # @return [true, false] whether or not the language is Gagauz.
    def gagauz? = _nii_locale&.subset_of?('gag')

    # @return [true, false] whether or not the language is Galician.
    def galician? = _nii_locale&.subset_of?('gl')

    # @return [true, false] whether or not the language is Gan Chinese.
    def gan_chinese? = _nii_locale&.subset_of?('gan')

    # @return [true, false] whether or not the language is Ganda.
    def ganda? = _nii_locale&.subset_of?('lg')

    # @return [true, false] whether or not the language is Gayo.
    def gayo? = _nii_locale&.subset_of?('gay')

    # @return [true, false] whether or not the language is Gbaya.
    def gbaya? = _nii_locale&.subset_of?('gba')

    # @return [true, false] whether or not the language is Geez.
    def geez? = _nii_locale&.subset_of?('gez')

    # @return [true, false] whether or not the language is Georgian.
    def georgian? = _nii_locale&.subset_of?('ka')

    # @return [true, false] whether or not the language is German.
    def german?(strict = false)
      return standard_german? if strict
      standard_german?     || swiss_german?    || low_german?      ||
      middle_high_german?  || old_high_german? || palatine_german? ||
      pennsylvania_german? || plautdietsch?    || main_franconian? ||
      bavarian?            || colognian?
    end

    # @return [true, false] whether or not the language is Gheg Albanian.
    def gheg_albanian? = _nii_locale&.subset_of?('aln')

    # @return [true, false] whether or not the language is Ghomala.
    def ghomala? = _nii_locale&.subset_of?('bbj')

    # @return [true, false] whether or not the language is Gilaki.
    def gilaki? = _nii_locale&.subset_of?('glk')

    # @return [true, false] whether or not the language is Gilbertese.
    def gilbertese? = _nii_locale&.subset_of?('gil')

    # @return [true, false] whether or not the language is Goan Konkani.
    def goan_konkani? = _nii_locale&.subset_of?('gom')

    # @return [true, false] whether or not the language is Gondi.
    def gondi? = _nii_locale&.subset_of?('gon')

    # @return [true, false] whether or not the language is Gorontalo.
    def gorontalo? = _nii_locale&.subset_of?('gor')

    # @return [true, false] whether or not the language is Gothic.
    def gothic? = _nii_locale&.subset_of?('got')

    # @return [true, false] whether or not the language is Grebo.
    def grebo? = _nii_locale&.subset_of?('grb')

    # @return [true, false] whether or not the language is Greek.
    def greek? = _nii_locale&.subset_of?('el')

    # @return [true, false] whether or not the language is Guarani.
    def guarani? = _nii_locale&.subset_of?('gn')

    # @return [true, false] whether or not the language is Gujarati.
    def gujarati? = _nii_locale&.subset_of?('gu')

    # @return [true, false] whether or not the language is Gusii.
    def gusii? = _nii_locale&.subset_of?('guz')

    # @return [true, false] whether or not the language is Gwichʼin.
    def gwichin? = _nii_locale&.subset_of?('gwi')

    # @return [true, false] whether or not the language is Haida.
    def haida? = _nii_locale&.subset_of?('hai')

    # @return [true, false] whether or not the language is Haitian Creole.
    def haitian_creole? = _nii_locale&.subset_of?('ht')

    # @return [true, false] whether or not the language is Hakka Chinese.
    def hakka_chinese? = _nii_locale&.subset_of?('hak')

    # @return [true, false] whether or not the language is Hausa.
    def hausa? = _nii_locale&.subset_of?('ha')

    # @return [true, false] whether or not the language is Hawaiian.
    def hawaiian? = _nii_locale&.subset_of?('haw')

    # @return [true, false] whether or not the language is Hebrew.
    def hebrew? = _nii_locale&.subset_of?('he')

    # @return [true, false] whether or not the language is Herero.
    def herero? = _nii_locale&.subset_of?('hz')

    # @return [true, false] whether or not the language is Hiligaynon.
    def hiligaynon? = _nii_locale&.subset_of?('hil')

    # @return [true, false] whether or not the language is Hindi.
    def hindi? = _nii_locale&.subset_of?('hi')

    # @return [true, false] whether or not the language is Hiri Motu.
    def hiri_motu? = _nii_locale&.subset_of?('ho')

    # @return [true, false] whether or not the language is Hittite.
    def hittite? = _nii_locale&.subset_of?('hit')

    # @return [true, false] whether or not the language is Hmong.
    def hmong? = _nii_locale&.subset_of?('hmn')

    # @return [true, false] whether or not the language is Hungarian.
    def hungarian? = _nii_locale&.subset_of?('hu')

    # @return [true, false] whether or not the language is Hupa.
    def hupa? = _nii_locale&.subset_of?('hup')

    # @return [true, false] whether or not the language is Iban.
    def iban? = _nii_locale&.subset_of?('iba')

    # @return [true, false] whether or not the language is Ibibio.
    def ibibio? = _nii_locale&.subset_of?('ibb')

    # @return [true, false] whether or not the language is Icelandic.
    def icelandic? = _nii_locale&.subset_of?('is')

    # @return [true, false] whether or not the language is Ido.
    def ido? = _nii_locale&.subset_of?('io')

    # @return [true, false] whether or not the language is Igbo.
    def igbo? = _nii_locale&.subset_of?('ig')

    # @return [true, false] whether or not the language is Iloko.
    def iloko? = _nii_locale&.subset_of?('ilo')

    # @return [true, false] whether or not the language is Inari Sami.
    def inari_sami? = _nii_locale&.subset_of?('smn')

    # @return [true, false] whether or not the language is Indonesian.
    def indonesian? = _nii_locale&.subset_of?('id')

    # @return [true, false] whether or not the language is Ingrian.
    def ingrian? = _nii_locale&.subset_of?('izh')

    # @return [true, false] whether or not the language is Ingush.
    def ingush? = _nii_locale&.subset_of?('inh')

    # @return [true, false] whether or not the language is Interlingua.
    def interlingua? = _nii_locale&.subset_of?('ia')

    # @return [true, false] whether or not the language is Interlingue.
    def interlingue? = _nii_locale&.subset_of?('ie')

    # @return [true, false] whether or not the language is Inuktitut.
    def inuktitut? = _nii_locale&.subset_of?('iu')

    # @return [true, false] whether or not the language is Inupiaq.
    def inupiaq? = _nii_locale&.subset_of?('ik')

    # @return [true, false] whether or not the language is Irish.
    def irish? = _nii_locale&.subset_of?('ga')

    # @return [true, false] whether or not the language is Italian.
    def italian? = _nii_locale&.subset_of?('it')

    # @return [true, false] whether or not the language is Jamaican Creole English.
    def jamaican_creole_english? = _nii_locale&.subset_of?('jam')

    # @return [true, false] whether or not the language is Japanese.
    def japanese? = _nii_locale&.subset_of?('ja')

    # @return [true, false] whether or not the language is Javanese.
    def javanese? = _nii_locale&.subset_of?('jv')

    # @return [true, false] whether or not the language is Jju.
    def jju? = _nii_locale&.subset_of?('kaj')

    # @return [true, false] whether or not the language is Jola-Fonyi.
    def jola_fonyi? = _nii_locale&.subset_of?('dyo')

    # @return [true, false] whether or not the language is Judeo-Arabic.
    def judeo_arabic? = _nii_locale&.subset_of?('jrb')

    # @return [true, false] whether or not the language is Judeo-Persian.
    def judeo_persian? = _nii_locale&.subset_of?('jpr')

    # @return [true, false] whether or not the language is Jutish.
    def jutish? = _nii_locale&.subset_of?('jut')

    # @return [true, false] whether or not the language is Kabardian.
    def kabardian? = _nii_locale&.subset_of?('kbd')

    # @return [true, false] whether or not the language is Kabuverdianu.
    def kabuverdianu? = _nii_locale&.subset_of?('kea')

    # @return [true, false] whether or not the language is Kabyle.
    def kabyle? = _nii_locale&.subset_of?('kab')

    # @return [true, false] whether or not the language is Kachin.
    def kachin? = _nii_locale&.subset_of?('kac')

    # @return [true, false] whether or not the language is Kaingang.
    def kaingang? = _nii_locale&.subset_of?('kgp')

    # @return [true, false] whether or not the language is Kako.
    def kako? = _nii_locale&.subset_of?('kkj')

    # @return [true, false] whether or not the language is Kalaallisut.
    def kalaallisut? = _nii_locale&.subset_of?('kl')

    # @return [true, false] whether or not the language is Kalenjin.
    def kalenjin? = _nii_locale&.subset_of?('kln')

    # @return [true, false] whether or not the language is Kalmyk.
    def kalmyk? = _nii_locale&.subset_of?('xal')

    # @return [true, false] whether or not the language is Kamba.
    def kamba? = _nii_locale&.subset_of?('kam')

    # @return [true, false] whether or not the language is Kanembu.
    def kanembu? = _nii_locale&.subset_of?('kbl')

    # @return [true, false] whether or not the language is Kannada.
    def kannada? = _nii_locale&.subset_of?('kn')

    # @return [true, false] whether or not the language is Kanuri.
    def kanuri? = _nii_locale&.subset_of?('kr')

    # @return [true, false] whether or not the language is Kara-Kalpak.
    def kara_kalpak? = _nii_locale&.subset_of?('kaa')

    # @return [true, false] whether or not the language is Karachay-Balkar.
    def karachay_balkar? = _nii_locale&.subset_of?('krc')

    # @return [true, false] whether or not the language is Karelian.
    def karelian? = _nii_locale&.subset_of?('krl')

    # @return [true, false] whether or not the language is Kashmiri.
    def kashmiri? = _nii_locale&.subset_of?('ks')

    # @return [true, false] whether or not the language is Kashubian.
    def kashubian? = _nii_locale&.subset_of?('csb')

    # @return [true, false] whether or not the language is Kawi.
    def kawi? = _nii_locale&.subset_of?('kaw')

    # @return [true, false] whether or not the language is Kazakh.
    def kazakh? = _nii_locale&.subset_of?('kk')

    # @return [true, false] whether or not the language is Kenyang.
    def kenyang? = _nii_locale&.subset_of?('ken')

    # @return [true, false] whether or not the language is Khasi.
    def khasi? = _nii_locale&.subset_of?('kha')

    # @return [true, false] whether or not the language is Khmer.
    def khmer? = _nii_locale&.subset_of?('km')

    # @return [true, false] whether or not the language is Khotanese.
    def khotanese? = _nii_locale&.subset_of?('kho')

    # @return [true, false] whether or not the language is Khowar.
    def khowar? = _nii_locale&.subset_of?('khw')

    # @return [true, false] whether or not the language is Kʼicheʼ.
    def kiche? = _nii_locale&.subset_of?('quc')

    # @return [true, false] whether or not the language is Kikuyu.
    def kikuyu? = _nii_locale&.subset_of?('ki')

    # @return [true, false] whether or not the language is Kimbundu.
    def kimbundu? = _nii_locale&.subset_of?('kmb')

    # @return [true, false] whether or not the language is Kinaray-a.
    def kinaray_a? = _nii_locale&.subset_of?('krj')

    # @return [true, false] whether or not the language is Kinyarwanda.
    def kinyarwanda? = _nii_locale&.subset_of?('rw')

    # @return [true, false] whether or not the language is Kirmanjki.
    def kirmanjki? = _nii_locale&.subset_of?('kiu')

    # @return [true, false] whether or not the language is Klingon.
    def klingon? = _nii_locale&.subset_of?('tlh')

    # @return [true, false] whether or not the language is Kom.
    def kom? = _nii_locale&.subset_of?('bkm')

    # @return [true, false] whether or not the language is Komi.
    def komi? = _nii_locale&.subset_of?('kv')

    # @return [true, false] whether or not the language is Komi-Permyak.
    def komi_permyak? = _nii_locale&.subset_of?('koi')

    # @return [true, false] whether or not the language is Kongo.
    def kongo? = _nii_locale&.subset_of?('kg')

    # @return [true, false] whether or not the language is Konkani.
    def konkani? = _nii_locale&.subset_of?('kok')

    # @return [true, false] whether or not the language is Korean.
    def korean? = _nii_locale&.subset_of?('ko')

    # @return [true, false] whether or not the language is Koro.
    def koro? = _nii_locale&.subset_of?('kfo')

    # @return [true, false] whether or not the language is Kosraean.
    def kosraean? = _nii_locale&.subset_of?('kos')

    # @return [true, false] whether or not the language is Kotava.
    def kotava? = _nii_locale&.subset_of?('avk')

    # @return [true, false] whether or not the language is Koyra Chiini.
    def koyra_chiini? = _nii_locale&.subset_of?('khq')

    # @return [true, false] whether or not the language is Koyraboro Senni.
    def koyraboro_senni? = _nii_locale&.subset_of?('ses')

    # @return [true, false] whether or not the language is Kpelle.
    def kpelle? = _nii_locale&.subset_of?('kpe')

    # @return [true, false] whether or not the language is Krio.
    def krio? = _nii_locale&.subset_of?('kri')

    # @return [true, false] whether or not the language is Kuanyama.
    def kuanyama? = _nii_locale&.subset_of?('kj')

    # @return [true, false] whether or not the language is Kumyk.
    def kumyk? = _nii_locale&.subset_of?('kum')

    # @return [true, false] whether or not the language is Kurdish.
    def kurdish? = _nii_locale&.subset_of?('ku')

    # @return [true, false] whether or not the language is Kurukh.
    def kurukh? = _nii_locale&.subset_of?('kru')

    # @return [true, false] whether or not the language is Kutenai.
    def kutenai? = _nii_locale&.subset_of?('kut')

    # @return [true, false] whether or not the language is Kwasio.
    def kwasio? = _nii_locale&.subset_of?('nmg')

    # @return [true, false] whether or not the language is Kyrgyz.
    def kyrgyz? = _nii_locale&.subset_of?('ky')
    alias_method :kirghiz?, :kyrgyz?

    # @return [true, false] whether or not the language is Ladino.
    def ladino? = _nii_locale&.subset_of?('lad')

    # @return [true, false] whether or not the language is Lahnda.
    def lahnda? = _nii_locale&.subset_of?('lah')

    # @return [true, false] whether or not the language is Lakota.
    def lakota? = _nii_locale&.subset_of?('lkt')

    # @return [true, false] whether or not the language is Lamba.
    def lamba? = _nii_locale&.subset_of?('lam')

    # @return [true, false] whether or not the language is Langi.
    def langi? = _nii_locale&.subset_of?('lag')

    # @return [true, false] whether or not the language is Lao.
    def lao? = _nii_locale&.subset_of?('lo')

    # @return [true, false] whether or not the language is Latgalian.
    def latgalian? = _nii_locale&.subset_of?('ltg')

    # @return [true, false] whether or not the language is Latin.
    def latin? = _nii_locale&.subset_of?('la')

    # @return [true, false] whether or not the language is Latin American Spanish.
    def latin_american_spanish? = _nii_locale&.subset_of?('es-419')

    # @return [true, false] whether or not the language is Latvian.
    def latvian? = _nii_locale&.subset_of?('lv')

    # @return [true, false] whether or not the language is Laz.
    def laz? = _nii_locale&.subset_of?('lzz')

    # @return [true, false] whether or not the language is Lezghian.
    def lezghian? = _nii_locale&.subset_of?('lez')

    # @return [true, false] whether or not the language is Ligurian.
    def ligurian? = _nii_locale&.subset_of?('lij')

    # @return [true, false] whether or not the language is Limburgish.
    def limburgish? = _nii_locale&.subset_of?('li')

    # @return [true, false] whether or not the language is Lingala.
    def lingala? = _nii_locale&.subset_of?('ln')

    # @return [true, false] whether or not the language is Lingua Franca Nova.
    def lingua_franca_nova? = _nii_locale&.subset_of?('lfn')

    # @return [true, false] whether or not the language is Literary Chinese.
    def literary_chinese? = _nii_locale&.subset_of?('lzh')

    # @return [true, false] whether or not the language is Lithuanian.
    def lithuanian? = _nii_locale&.subset_of?('lt')

    # @return [true, false] whether or not the language is Livonian.
    def livonian? = _nii_locale&.subset_of?('liv')

    # @return [true, false] whether or not the language is Lojban.
    def lojban? = _nii_locale&.subset_of?('jbo')

    # @return [true, false] whether or not the language is Lombard.
    def lombard? = _nii_locale&.subset_of?('lmo')

    # @return [true, false] whether or not the language is Louisiana Creole.
    def louisiana_creole? = _nii_locale&.subset_of?('lou')

    # @return [true, false] whether or not the language is Low German.
    def low_german? = _nii_locale&.subset_of?('nds')

    # @return [true, false] whether or not the language is Low Saxon.
    def low_saxon? = _nii_locale&.subset_of?('nds-NL')

    # @return [true, false] whether or not the language is Lower Silesian.
    def lower_silesian? = _nii_locale&.subset_of?('sli')

    # @return [true, false] whether or not the language is Lower Sorbian.
    def lower_sorbian? = _nii_locale&.subset_of?('dsb')

    # @return [true, false] whether or not the language is Lozi.
    def lozi? = _nii_locale&.subset_of?('loz')

    # @return [true, false] whether or not the language is Luba-Katanga.
    def luba_katanga? = _nii_locale&.subset_of?('lu')

    # @return [true, false] whether or not the language is Luba-Lulua.
    def luba_lulua? = _nii_locale&.subset_of?('lua')

    # @return [true, false] whether or not the language is Luiseno.
    def luiseno? = _nii_locale&.subset_of?('lui')

    # @return [true, false] whether or not the language is Lule Sami.
    def lule_sami? = _nii_locale&.subset_of?('smj')

    # @return [true, false] whether or not the language is Lunda.
    def lunda? = _nii_locale&.subset_of?('lun')

    # @return [true, false] whether or not the language is Luo.
    def luo? = _nii_locale&.subset_of?('luo')

    # @return [true, false] whether or not the language is Luxembourgish.
    def luxembourgish? = _nii_locale&.subset_of?('lb')

    # @return [true, false] whether or not the language is Luyia.
    def luyia? = _nii_locale&.subset_of?('luy')

    # @return [true, false] whether or not the language is Maba.
    def maba? = _nii_locale&.subset_of?('mde')

    # @return [true, false] whether or not the language is Macedonian.
    def macedonian? = _nii_locale&.subset_of?('mk')

    # @return [true, false] whether or not the language is Machame.
    def machame? = _nii_locale&.subset_of?('jmc')

    # @return [true, false] whether or not the language is Madurese.
    def madurese? = _nii_locale&.subset_of?('mad')

    # @return [true, false] whether or not the language is Mafa.
    def mafa? = _nii_locale&.subset_of?('maf')

    # @return [true, false] whether or not the language is Magahi.
    def magahi? = _nii_locale&.subset_of?('mag')

    # @return [true, false] whether or not the language is Main-Franconian.
    def main_franconian? = _nii_locale&.subset_of?('vmf')

    # @return [true, false] whether or not the language is Maithili.
    def maithili? = _nii_locale&.subset_of?('mai')

    # @return [true, false] whether or not the language is Makasar.
    def makasar? = _nii_locale&.subset_of?('mak')

    # @return [true, false] whether or not the language is Makhuwa-Meetto.
    def makhuwa_meetto? = _nii_locale&.subset_of?('mgh')

    # @return [true, false] whether or not the language is Makonde.
    def makonde? = _nii_locale&.subset_of?('kde')

    # @return [true, false] whether or not the language is Malagasy.
    def malagasy? = _nii_locale&.subset_of?('mg')

    # @return [true, false] whether or not the language is Malay.
    def malay? = malaysian? || indonesian?
    
    # @return [true, false] whether or not the language is Malaysian.
    def malaysian? = _nii_locale&.subset_of?('ms') || _nii_locale&.subset_of?('zsm')

    # @return [true, false] whether or not the language is Malayalam.
    def malayalam? = _nii_locale&.subset_of?('ml')

    # @return [true, false] whether or not the language is Maltese.
    def maltese? = _nii_locale&.subset_of?('mt')

    # @return [true, false] whether or not the language is Manchu.
    def manchu? = _nii_locale&.subset_of?('mnc')

    # @return [true, false] whether or not the language is Mandar.
    def mandar? = _nii_locale&.subset_of?('mdr')
      
    # @return [true, false] whether or not the language is Mandarin Chinese.
    def mandarin_chinese? = _nii_locale&.subset_of?('zh')
    alias_method :mandarin?, :mandarin_chinese?

    # @return [true, false] whether or not the language is Mandingo.
    def mandingo? = _nii_locale&.subset_of?('man')

    # @return [true, false] whether or not the language is Manipuri.
    def manipuri? = _nii_locale&.subset_of?('mni')

    # @return [true, false] whether or not the language is Manx.
    def manx? = _nii_locale&.subset_of?('gv')

    # @return [true, false] whether or not the language is Maori.
    def maori? = _nii_locale&.subset_of?('mi')

    # @return [true, false] whether or not the language is Mapuche.
    def mapuche? = _nii_locale&.subset_of?('arn')

    # @return [true, false] whether or not the language is Marathi.
    def marathi? = _nii_locale&.subset_of?('mr')

    # @return [true, false] whether or not the language is Mari.
    def mari? = _nii_locale&.subset_of?('chm')

    # @return [true, false] whether or not the language is Marshallese.
    def marshallese? = _nii_locale&.subset_of?('mh')

    # @return [true, false] whether or not the language is Marwari.
    def marwari? = _nii_locale&.subset_of?('mwr')

    # @return [true, false] whether or not the language is Masai.
    def masai? = _nii_locale&.subset_of?('mas')

    # @return [true, false] whether or not the language is Mazanderani.
    def mazanderani? = _nii_locale&.subset_of?('mzn')

    # @return [true, false] whether or not the language is Medumba.
    def medumba? = _nii_locale&.subset_of?('byv')

    # @return [true, false] whether or not the language is Mende.
    def mende? = _nii_locale&.subset_of?('men')

    # @return [true, false] whether or not the language is Mentawai.
    def mentawai? = _nii_locale&.subset_of?('mwv')

    # @return [true, false] whether or not the language is Meru.
    def meru? = _nii_locale&.subset_of?('mer')

    # @return [true, false] whether or not the language is Metaʼ.
    def meta? = _nii_locale&.subset_of?('mgo')

    # @return [true, false] whether or not the language is Mexican Spanish.
    def mexican_spanish? = _nii_locale&.subset_of?('es-MX')

    # @return [true, false] whether or not the language is Middle Dutch.
    def middle_dutch? = _nii_locale&.subset_of?('dum')

    # @return [true, false] whether or not the language is Middle English.
    def middle_english? = _nii_locale&.subset_of?('enm')

    # @return [true, false] whether or not the language is Middle French.
    def middle_french? = _nii_locale&.subset_of?('frm')

    # @return [true, false] whether or not the language is Middle High German.
    def middle_high_german? = _nii_locale&.subset_of?('gmh')

    # @return [true, false] whether or not the language is Middle Irish.
    def middle_irish? = _nii_locale&.subset_of?('mga')

    # @return [true, false] whether or not the language is Mi'kmaq.
    def mikmaq? = _nii_locale&.subset_of?('mic')

    # @return [true, false] whether or not the language is Min Nan Chinese.
    def min_nan_chinese? = _nii_locale&.subset_of?('nan')

    # @return [true, false] whether or not the language is Minangkabau.
    def minangkabau? = _nii_locale&.subset_of?('min')

    # @return [true, false] whether or not the language is Mingrelian.
    def mingrelian? = _nii_locale&.subset_of?('xmf')

    # @return [true, false] whether or not the language is Mirandese.
    def mirandese? = _nii_locale&.subset_of?('mwl')

    # @return [true, false] whether or not the language is Mizo.
    def mizo? = _nii_locale&.subset_of?('lus')

    # @return [true, false] whether or not the language is Modern Standard Arabic.
    def modern_standard_arabic? = _nii_locale&.subset_of?('ar-001')

    # @return [true, false] whether or not the language is Mohawk.
    def mohawk? = _nii_locale&.subset_of?('moh')

    # @return [true, false] whether or not the language is Moksha.
    def moksha? = _nii_locale&.subset_of?('mdf')

    # @return [true, false] whether or not the language is Moldavian.
    def moldavian? = _nii_locale&.subset_of?('ro-MD')

    # @return [true, false] whether or not the language is Mongo.
    def mongo? = _nii_locale&.subset_of?('lol')

    # @return [true, false] whether or not the language is Mongolian.
    def mongolian? = _nii_locale&.subset_of?('mn')

    # @return [true, false] whether or not the language is Montenegrin.
    def montenegrin? = _nii_locale&.subset_of?('sr-ME')

    # @return [true, false] whether or not the language is Morisyen.
    def morisyen? = _nii_locale&.subset_of?('mfe')

    # @return [true, false] whether or not the language is Moroccan Arabic.
    def moroccan_arabic? = _nii_locale&.subset_of?('ary')

    # @return [true, false] whether or not the language is Mossi.
    def mossi? = _nii_locale&.subset_of?('mos')

    # @return [true, false] whether or not the content is in multiple languages.
    def multiple_languages? = _nii_locale&.language == 'mul'

    # @return [true, false] whether or not the language is Mundang.
    def mundang? = _nii_locale&.subset_of?('mua')

    # @return [true, false] whether or not the language is Muscogee.
    def muscogee? = _nii_locale&.subset_of?('mus')

    # @return [true, false] whether or not the language is Muslim Tat.
    def muslim_tat? = _nii_locale&.subset_of?('ttt')
    alias_method :tati_persian?, :muslim_tat?

    # @return [true, false] whether or not the language is Myene.
    def myene? = _nii_locale&.subset_of?('mye')

    # @return [true, false] whether or not the language is Najdi Arabic.
    def najdi_arabic? = _nii_locale&.subset_of?('ars')

    # @return [true, false] whether or not the language is Nama.
    def nama? = _nii_locale&.subset_of?('naq')

    # @return [true, false] whether or not the language is Nauru.
    def nauru? = _nii_locale&.subset_of?('na')

    # @return [true, false] whether or not the language is Navajo.
    def navajo? = _nii_locale&.subset_of?('nv')

    # @return [true, false] whether or not the language is Ndonga.
    def ndonga? = _nii_locale&.subset_of?('ng')

    # @return [true, false] whether or not the language is Neapolitan.
    def neapolitan? = _nii_locale&.subset_of?('nap')

    # @return [true, false] whether or not the language is Nepali.
    def nepali? = _nii_locale&.subset_of?('ne')

    # @return [true, false] whether or not the language is Newari.
    def newari? = _nii_locale&.subset_of?('new')

    # @return [true, false] whether or not the language is Ngambay.
    def ngambay? = _nii_locale&.subset_of?('sba')

    # @return [true, false] whether or not the language is Ngiemboon.
    def ngiemboon? = _nii_locale&.subset_of?('nnh')

    # @return [true, false] whether or not the language is Ngomba.
    def ngomba? = _nii_locale&.subset_of?('jgo')

    # @return [true, false] whether or not the language is Nheengatu.
    def nheengatu? = _nii_locale&.subset_of?('yrl')

    # @return [true, false] whether or not the language is Nias.
    def nias? = _nii_locale&.subset_of?('nia')

    # @return [true, false] whether or not the language is Nigerian Pidgin.
    def nigerian_pidgin? = _nii_locale&.subset_of?('pcm')

    # @return [true, false] whether or not the language is Niuean.
    def niuean? = _nii_locale&.subset_of?('niu')

    # @return [true, false] whether or not the language is N’Ko.
    def nko? = _nii_locale&.subset_of?('nqo')

    # @return [true, false] whether or not there is no linguistic content.
    def no_linguistic_content? = _nii_locale&.subset_of?('zxx')

    # @return [true, false] whether or not the language is Nogai.
    def nogai? = _nii_locale&.subset_of?('nog')

    # @return [true, false] whether or not the language is North Ndebele.
    def north_ndebele? = _nii_locale&.subset_of?('nd')

    # @return [true, false] whether or not the language is Northern Frisian.
    def northern_frisian? = _nii_locale&.subset_of?('frr')

    # @return [true, false] whether or not the language is Northern Luri.
    def northern_luri? = _nii_locale&.subset_of?('lrc')

    # @return [true, false] whether or not the language is Northern Sami.
    def northern_sami? = _nii_locale&.subset_of?('se')

    # @return [true, false] whether or not the language is Northern Sotho.
    def northern_sotho? = _nii_locale&.subset_of?('nso')

    # @return [true, false] whether or not the language is Norwegian.
    def norwegian?
      return true if _nii_locale&.subset_of?('no')
      norwegian_bokmal? or norwegian_nynorsk?
    end

    # @return [true, false] whether or not the language is Norwegian Bokmål.
    def norwegian_bokmal? = _nii_locale&.subset_of?('nb')
    alias_method :bokmal?, :norwegian_bokmal?

    # @return [true, false] whether or not the language is Norwegian Nynorsk.
    def norwegian_nynorsk? = _nii_locale&.subset_of?('nn')
    alias_method :nynorsk?, :norwegian_nynorsk?

    # @return [true, false] whether or not the language is Novial.
    def novial? = _nii_locale&.subset_of?('nov')

    # @return [true, false] whether or not the language is Nuer.
    def nuer? = _nii_locale&.subset_of?('nus')

    # @return [true, false] whether or not the language is Nyamwezi.
    def nyamwezi? = _nii_locale&.subset_of?('nym')

    # @return [true, false] whether or not the language is Nyanja.
    def nyanja? = _nii_locale&.subset_of?('ny')

    # @return [true, false] whether or not the language is Nyankole.
    def nyankole? = _nii_locale&.subset_of?('nyn')

    # @return [true, false] whether or not the language is Nyasa Tonga.
    def nyasa_tonga? = _nii_locale&.subset_of?('tog')

    # @return [true, false] whether or not the language is Nyoro.
    def nyoro? = _nii_locale&.subset_of?('nyo')

    # @return [true, false] whether or not the language is Nzima.
    def nzima? = _nii_locale&.subset_of?('nzi')

    # @return [true, false] whether or not the language is Occitan.
    def occitan? = _nii_locale&.subset_of?('oc')

    # @return [true, false] whether or not the language is Odia.
    def odia? = _nii_locale&.subset_of?('or')

    # @return [true, false] whether or not the language is Ojibwa.
    def ojibwa? = _nii_locale&.subset_of?('oj')

    # @return [true, false] whether or not the language is Old English.
    def old_english? = _nii_locale&.subset_of?('ang')

    # @return [true, false] whether or not the language is Old French.
    def old_french? = _nii_locale&.subset_of?('fro')

    # @return [true, false] whether or not the language is Old High German.
    def old_high_german? = _nii_locale&.subset_of?('goh')

    # @return [true, false] whether or not the language is Old Irish.
    def old_irish? = _nii_locale&.subset_of?('sga')

    # @return [true, false] whether or not the language is Old Norse.
    def old_norse? = _nii_locale&.subset_of?('non')

    # @return [true, false] whether or not the language is Old Persian.
    def old_persian? = _nii_locale&.subset_of?('peo')

    # @return [true, false] whether or not the language is Old Provençal.
    def old_provencal? = _nii_locale&.subset_of?('pro')

    # @return [true, false] whether or not the language is Oromo.
    def oromo? = _nii_locale&.subset_of?('om')

    # @return [true, false] whether or not the language is Osage.
    def osage? = _nii_locale&.subset_of?('osa')

    # @return [true, false] whether or not the language is Ossetic.
    def ossetic? = _nii_locale&.subset_of?('os')

    # @return [true, false] whether or not the language is Ottoman Turkish.
    def ottoman_turkish? = _nii_locale&.subset_of?('ota')

    # @return [true, false] whether or not the language is Pahlavi.
    def pahlavi? = _nii_locale&.subset_of?('pal')

    # @return [true, false] whether or not the language is Palatine German.
    def palatine_german? = _nii_locale&.subset_of?('pfl')

    # @return [true, false] whether or not the language is Palauan.
    def palauan? = _nii_locale&.subset_of?('pau')

    # @return [true, false] whether or not the language is Pali.
    def pali? = _nii_locale&.subset_of?('pi')

    # @return [true, false] whether or not the language is Pampanga.
    def pampanga? = _nii_locale&.subset_of?('pam')

    # @return [true, false] whether or not the language is Pangasinan.
    def pangasinan? = _nii_locale&.subset_of?('pag')

    # @return [true, false] whether or not the language is Papiamento.
    def papiamento? = _nii_locale&.subset_of?('pap')

    # @return [true, false] whether or not the language is Pashto.
    def pashto? = _nii_locale&.subset_of?('ps')
    alias_method :pushto?, :pashto?

    # @return [true, false] whether or not the language is Pennsylvania German.
    def pennsylvania_german? = _nii_locale&.subset_of?('pdc')

    # @return [true, false] whether or not the language is Persian.
    def persian? = _nii_locale&.subset_of?('fa')

    # @return [true, false] whether or not the language is Phoenician.
    def phoenician? = _nii_locale&.subset_of?('phn')

    # @return [true, false] whether or not the language is Picard.
    def picard? = _nii_locale&.subset_of?('pcd')

    # @return [true, false] whether or not the language is Piedmontese.
    def piedmontese? = _nii_locale&.subset_of?('pms')

    # @return [true, false] whether or not the language is Plautdietsch.
    def plautdietsch? = _nii_locale&.subset_of?('pdt')

    # @return [true, false] whether or not the language is Pohnpeian.
    def pohnpeian? = _nii_locale&.subset_of?('pon')

    # @return [true, false] whether or not the language is Polish.
    def polish? = _nii_locale&.subset_of?('pl')

    # @return [true, false] whether or not the language is Pontic.
    def pontic? = _nii_locale&.subset_of?('pnt')

    # @return [true, false] whether or not the language is Portuguese.
    def portuguese? = _nii_locale&.subset_of?('pt')

    # @return [true, false] whether or not the language is Prussian.
    def prussian? = _nii_locale&.subset_of?('prg')

    # @return [true, false] whether or not the language is Punjabi.
    def punjabi? = _nii_locale&.subset_of?('pa')

    # @return [true, false] whether or not the language is Quechua.
    def quechua? = _nii_locale&.subset_of?('qu')

    # @return [true, false] whether or not the language is Rajasthani.
    def rajasthani? = _nii_locale&.subset_of?('raj')

    # @return [true, false] whether or not the language is Rapanui.
    def rapanui? = _nii_locale&.subset_of?('rap')

    # @return [true, false] whether or not the language is Rarotongan.
    def rarotongan? = _nii_locale&.subset_of?('rar')

    # @return [true, false] whether or not the language is Riffian.
    def riffian? = _nii_locale&.subset_of?('rif')

    # @return [true, false] whether or not the language is Romagnol.
    def romagnol? = _nii_locale&.subset_of?('rgn')

    # @return [true, false] whether or not the language is Romanian.
    def romanian? = _nii_locale&.subset_of?('ro')

    # @return [true, false] whether or not the language is Romansh.
    def romansh? = _nii_locale&.subset_of?('rm')

    # @return [true, false] whether or not the language is Romany.
    def romany? = _nii_locale&.subset_of?('rom')

    # @return [true, false] whether or not the language is Rombo.
    def rombo? = _nii_locale&.subset_of?('rof')

    # @return [true, false] whether or not the language is Rotuman.
    def rotuman? = _nii_locale&.subset_of?('rtm')

    # @return [true, false] whether or not the language is Roviana.
    def roviana? = _nii_locale&.subset_of?('rug')

    # @return [true, false] whether or not the language is Rundi.
    def rundi? = _nii_locale&.subset_of?('rn')

    # @return [true, false] whether or not the language is Russian.
    def russian? = _nii_locale&.subset_of?('ru')

    # @return [true, false] whether or not the language is Rusyn.
    def rusyn? = _nii_locale&.subset_of?('rue')

    # @return [true, false] whether or not the language is Rwa.
    def rwa? = _nii_locale&.subset_of?('rwk')

    # @return [true, false] whether or not the language is Saho.
    def saho? = _nii_locale&.subset_of?('ssy')

    # @return [true, false] whether or not the language is Sakha.
    def sakha? = _nii_locale&.subset_of?('sah')

    # @return [true, false] whether or not the language is Samaritan Aramaic.
    def samaritan_aramaic? = _nii_locale&.subset_of?('sam')

    # @return [true, false] whether or not the language is Samburu.
    def samburu? = _nii_locale&.subset_of?('saq')

    # @return [true, false] whether or not the language is Samoan.
    def samoan? = _nii_locale&.subset_of?('sm')

    # @return [true, false] whether or not the language is Samogitian.
    def samogitian? = _nii_locale&.subset_of?('sgs')

    # @return [true, false] whether or not the language is Sandawe.
    def sandawe? = _nii_locale&.subset_of?('sad')

    # @return [true, false] whether or not the language is Sango.
    def sango? = _nii_locale&.subset_of?('sg')

    # @return [true, false] whether or not the language is Sangu.
    def sangu? = _nii_locale&.subset_of?('sbp')

    # @return [true, false] whether or not the language is Sanskrit.
    def sanskrit? = _nii_locale&.subset_of?('sa')

    # @return [true, false] whether or not the language is Santali.
    def santali? = _nii_locale&.subset_of?('sat')

    # @return [true, false] whether or not the language is Sardinian.
    def sardinian? = _nii_locale&.subset_of?('sc')

    # @return [true, false] whether or not the language is Sasak.
    def sasak? = _nii_locale&.subset_of?('sas')

    # @return [true, false] whether or not the language is Sassarese Sardinian.
    def sassarese_sardinian? = _nii_locale&.subset_of?('sdc')

    # @return [true, false] whether or not the language is Saterland Frisian.
    def saterland_frisian? = _nii_locale&.subset_of?('stq')

    # @return [true, false] whether or not the language is Saurashtra.
    def saurashtra? = _nii_locale&.subset_of?('saz')

    # @return [true, false] whether or not the language is Scots.
    def scots? = _nii_locale&.subset_of?('sco')

    # @return [true, false] whether or not the language is Scottish Gaelic.
    def scottish_gaelic? = _nii_locale&.subset_of?('gd')

    # @return [true, false] whether or not the language is Selayar.
    def selayar? = _nii_locale&.subset_of?('sly')

    # @return [true, false] whether or not the language is Selkup.
    def selkup? = _nii_locale&.subset_of?('sel')

    # @return [true, false] whether or not the language is Sena.
    def sena? = _nii_locale&.subset_of?('seh')

    # @return [true, false] whether or not the language is Seneca.
    def seneca? = _nii_locale&.subset_of?('see')

    # @return [true, false] whether or not the language is Serbian.
    def serbian? = _nii_locale&.subset_of?('sr')

    # @return [true, false] whether or not the language is Serbo-Croatian.
    def serbo_croatian? = _nii_locale&.subset_of?('sh')

    # @return [true, false] whether or not the language is Serer.
    def serer? = _nii_locale&.subset_of?('srr')

    # @return [true, false] whether or not the language is Seri.
    def seri? = _nii_locale&.subset_of?('sei')

    # @return [true, false] whether or not the language is Seselwa Creole French.
    def seselwa_creole_french? = _nii_locale&.subset_of?('crs')

    # @return [true, false] whether or not the language is Shambala.
    def shambala? = _nii_locale&.subset_of?('ksb')

    # @return [true, false] whether or not the language is Shan.
    def shan? = _nii_locale&.subset_of?('shn')

    # @return [true, false] whether or not the language is Shona.
    def shona? = _nii_locale&.subset_of?('sn')

    # @return [true, false] whether or not the language is Sichuan Yi.
    def sichuan_yi? = _nii_locale&.subset_of?('ii')

    # @return [true, false] whether or not the language is Sicilian.
    def sicilian? = _nii_locale&.subset_of?('scn')

    # @return [true, false] whether or not the language is Sidamo.
    def sidamo? = _nii_locale&.subset_of?('sid')

    # @return [true, false] whether or not the language is Siksika.
    def siksika? = _nii_locale&.subset_of?('bla')

    # @return [true, false] whether or not the language is Silesian.
    def silesian? = _nii_locale&.subset_of?('szl')

    # @return [true, false] whether or not the language is Simplified Chinese.
    def simplified_chinese? = _nii_locale&.subset_of?('zh-Hans')
    alias_method :simplified_mandarin_chinese?, :simplified_chinese?

    # @return [true, false] whether or not the language is Sindhi.
    def sindhi? = _nii_locale&.subset_of?('sd')

    # @return [true, false] whether or not the language is Sinhala.
    def sinhala? = _nii_locale&.subset_of?('si')

    # @return [true, false] whether or not the language is Skolt Sami.
    def skolt_sami? = _nii_locale&.subset_of?('sms')

    # @return [true, false] whether or not the language is Slave.
    def slave? = _nii_locale&.subset_of?('den')

    # @return [true, false] whether or not the language is Slovak.
    def slovak? = _nii_locale&.subset_of?('sk')

    # @return [true, false] whether or not the language is Slovenian.
    def slovenian? = _nii_locale&.subset_of?('sl')

    # @return [true, false] whether or not the language is Soga.
    def soga? = _nii_locale&.subset_of?('xog')

    # @return [true, false] whether or not the language is Sogdien.
    def sogdien? = _nii_locale&.subset_of?('sog')

    # @return [true, false] whether or not the language is Somali.
    def somali? = _nii_locale&.subset_of?('so')

    # @return [true, false] whether or not the language is Soninke.
    def soninke? = _nii_locale&.subset_of?('snk')

    # @return [true, false] whether or not the language is South Ndebele.
    def south_ndebele? = _nii_locale&.subset_of?('nr')

    # @return [true, false] whether or not the language is Southern Altai.
    def southern_altai? = _nii_locale&.subset_of?('alt')

    # @return [true, false] whether or not the language is Southern Kurdish.
    def southern_kurdish? = _nii_locale&.subset_of?('sdh')

    # @return [true, false] whether or not the language is Southern Sami.
    def southern_sami? = _nii_locale&.subset_of?('sma')

    # @return [true, false] whether or not the language is Southern Sotho.
    def southern_sotho? = _nii_locale&.subset_of?('st')

    # @return [true, false] whether or not the language is Spanish.
    def spanish? = _nii_locale&.subset_of?('es')

    # @return [true, false] whether or not the language is Sranan Tongo.
    def sranan_tongo? = _nii_locale&.subset_of?('srn')
    
    # @return [true, false] whether or not the language is Standard German.
    def standard_german? = _nii_locale&.subset_of?('de')

    # @return [true, false] whether or not the language is Standard Turkish.
    def standard_turkish? = _nii_locale&.subset_of?('tr')

    # @return [true, false] whether or not the language is Standard Moroccan Tamazight.
    def standard_moroccan_tamazight? = _nii_locale&.subset_of?('zgh')

    # @return [true, false] whether or not the language is Sukuma.
    def sukuma? = _nii_locale&.subset_of?('suk')

    # @return [true, false] whether or not the language is Sumerian.
    def sumerian? = _nii_locale&.subset_of?('sux')

    # @return [true, false] whether or not the language is Sundanese.
    def sundanese? = _nii_locale&.subset_of?('su')

    # @return [true, false] whether or not the language is Susu.
    def susu? = _nii_locale&.subset_of?('sus')

    # @return [true, false] whether or not the language is Swahili.
    def swahili? = _nii_locale&.subset_of?('sw')

    # @return [true, false] whether or not the language is Swati.
    def swati? = _nii_locale&.subset_of?('ss')

    # @return [true, false] whether or not the language is Swedish.
    def swedish? = _nii_locale&.subset_of?('sv')

    # @return [true, false] whether or not the language is Swiss French.
    def swiss_french? = _nii_locale&.subset_of?('fr-CH')

    # @return [true, false] whether or not the language is Swiss German.
    def swiss_german? = _nii_locale&.subset_of?('gsw')

    # @return [true, false] whether or not the language is Swiss High German.
    def swiss_high_german? = _nii_locale&.subset_of?('de-CH')

    # @return [true, false] whether or not the language is Syriac.
    def syriac? = _nii_locale&.subset_of?('syr')

    # @return [true, false] whether or not the language is Tachelhit.
    def tachelhit? = _nii_locale&.subset_of?('shi')

    # @return [true, false] whether or not the language is Tagalog.
    def tagalog? = _nii_locale&.subset_of?('tl')

    # @return [true, false] whether or not the language is Tahitian.
    def tahitian? = _nii_locale&.subset_of?('ty')

    # @return [true, false] whether or not the language is Taita.
    def taita? = _nii_locale&.subset_of?('dav')

    # @return [true, false] whether or not the language is Tajik.
    def tajik? = _nii_locale&.subset_of?('tg')

    # @return [true, false] whether or not the language is Talysh.
    def talysh? = _nii_locale&.subset_of?('tly')

    # @return [true, false] whether or not the language is Tamashek.
    def tamashek? = _nii_locale&.subset_of?('tmh')

    # @return [true, false] whether or not the language is Tamil.
    def tamil? = _nii_locale&.subset_of?('ta')

    # @return [true, false] whether or not the language is Taroko.
    def taroko? = _nii_locale&.subset_of?('trv')

    # @return [true, false] whether or not the language is Tasawaq.
    def tasawaq? = _nii_locale&.subset_of?('twq')

    # @return [true, false] whether or not the language is Tatar.
    def tatar? = _nii_locale&.subset_of?('tt')

    # @return [true, false] whether or not the language is Telugu.
    def telugu? = _nii_locale&.subset_of?('te')

    # @return [true, false] whether or not the language is Tereno.
    def tereno? = _nii_locale&.subset_of?('ter')

    # @return [true, false] whether or not the language is Teso.
    def teso? = _nii_locale&.subset_of?('teo')

    # @return [true, false] whether or not the language is Tetum.
    def tetum? = _nii_locale&.subset_of?('tet')

    # @return [true, false] whether or not the language is Thai.
    def thai? = _nii_locale&.subset_of?('th')

    # @return [true, false] whether or not the language is Tibetan.
    def tibetan? = _nii_locale&.subset_of?('bo')

    # @return [true, false] whether or not the language is Tigre.
    def tigre? = _nii_locale&.subset_of?('tig')

    # @return [true, false] whether or not the language is Tigrinya.
    def tigrinya? = _nii_locale&.subset_of?('ti')

    # @return [true, false] whether or not the language is Timne.
    def timne? = _nii_locale&.subset_of?('tem')

    # @return [true, false] whether or not the language is Tiv.
    def tiv? = _nii_locale&.subset_of?('tiv')

    # @return [true, false] whether or not the language is Tlingit.
    def tlingit? = _nii_locale&.subset_of?('tli')

    # @return [true, false] whether or not the language is Tok Pisin.
    def tok_pisin? = _nii_locale&.subset_of?('tpi')

    # @return [true, false] whether or not the language is Tokelau.
    def tokelau? = _nii_locale&.subset_of?('tkl')

    # @return [true, false] whether or not the language is Tongan.
    def tongan? = _nii_locale&.subset_of?('to')

    # @return [true, false] whether or not the language is Tornedalen Finnish.
    def tornedalen_finnish? = _nii_locale&.subset_of?('fit')

    # @return [true, false] whether or not the language is Traditional Chinese.
    def traditional_chinese? = _nii_locale&.subset_of?('zh-Hant')
    alias_method :traditional_mandarin_chinese?, :traditional_chinese?

    # @return [true, false] whether or not the language is Tsakhur.
    def tsakhur? = _nii_locale&.subset_of?('tkr')

    # @return [true, false] whether or not the language is Tsakonian.
    def tsakonian? = _nii_locale&.subset_of?('tsd')

    # @return [true, false] whether or not the language is Tsimshian.
    def tsimshian? = _nii_locale&.subset_of?('tsi')

    # @return [true, false] whether or not the language is Tsonga.
    def tsonga? = _nii_locale&.subset_of?('ts')

    # @return [true, false] whether or not the language is Tswana.
    def tswana? = _nii_locale&.subset_of?('tn')

    # @return [true, false] whether or not the language is Tulu.
    def tulu? = _nii_locale&.subset_of?('tcy')

    # @return [true, false] whether or not the language is Tumbuka.
    def tumbuka? = _nii_locale&.subset_of?('tum')

    # @return [true, false] whether or not the language is Tunisian Arabic.
    def tunisian_arabic? = _nii_locale&.subset_of?('aeb')

    # @return [true, false] whether or not the language is Turkish.
    def turkish?(strict = false)
      return standard_turkish? if strict
      standard_turkish? || ottoman_turkish? || crimean_turkish?
    end

    # @return [true, false] whether or not the language is Turkmen.
    def turkmen? = _nii_locale&.subset_of?('tk')

    # @return [true, false] whether or not the language is Turoyo.
    def turoyo? = _nii_locale&.subset_of?('tru')

    # @return [true, false] whether or not the language is Tuvalu.
    def tuvalu? = _nii_locale&.subset_of?('tvl')

    # @return [true, false] whether or not the language is Tuvinian.
    def tuvinian? = _nii_locale&.subset_of?('tyv')

    # @return [true, false] whether or not the language is Twi.
    def twi? = _nii_locale&.subset_of?('tw')

    # @return [true, false] whether or not the language is Tyap.
    def tyap? = _nii_locale&.subset_of?('kcg')

    # @return [true, false] whether or not the language is Udmurt.
    def udmurt? = _nii_locale&.subset_of?('udm')

    # @return [true, false] whether or not the language is Ugaritic.
    def ugaritic? = _nii_locale&.subset_of?('uga')

    # @return [true, false] whether or not the language is Ukrainian.
    def ukrainian? = _nii_locale&.subset_of?('uk')

    # @return [true, false] whether or not the language is Umbundu.
    def umbundu? = _nii_locale&.subset_of?('umb')

    # @return [true, false] whether or not the language is unknown.
    def unknown_language? = _nii_locale&.language.nil?

    # @return [true, false] whether or not the language is Upper Sorbian.
    def upper_sorbian? = _nii_locale&.subset_of?('hsb')

    # @return [true, false] whether or not the language is Urdu.
    def urdu? = _nii_locale&.subset_of?('ur')

    # @return [true, false] whether or not the language is Uyghur.
    def uyghur? = _nii_locale&.subset_of?('ug')
    alias_method :uighur?, :uyghur?

    # @return [true, false] whether or not the language is Uzbek.
    def uzbek? = _nii_locale&.subset_of?('uz')

    # @return [true, false] whether or not the language is Vai.
    def vai? = _nii_locale&.subset_of?('vai')

    # @return [true, false] whether or not the language is Venda.
    def venda? = _nii_locale&.subset_of?('ve')

    # @return [true, false] whether or not the language is Venetian.
    def venetian? = _nii_locale&.subset_of?('vec')

    # @return [true, false] whether or not the language is Veps.
    def veps? = _nii_locale&.subset_of?('vep')

    # @return [true, false] whether or not the language is Vietnamese.
    def vietnamese? = _nii_locale&.subset_of?('vi')

    # @return [true, false] whether or not the language is Volapük.
    def volapuk? = _nii_locale&.subset_of?('vo')

    # @return [true, false] whether or not the language is Võro.
    def voro? = _nii_locale&.subset_of?('vro')

    # @return [true, false] whether or not the language is Votic.
    def votic? = _nii_locale&.subset_of?('vot')

    # @return [true, false] whether or not the language is Vunjo.
    def vunjo? = _nii_locale&.subset_of?('vun')

    # @return [true, false] whether or not the language is Walloon.
    def walloon? = _nii_locale&.subset_of?('wa')

    # @return [true, false] whether or not the language is Walser.
    def walser? = _nii_locale&.subset_of?('wae')

    # @return [true, false] whether or not the language is Waray.
    def waray? = _nii_locale&.subset_of?('war')

    # @return [true, false] whether or not the language is Warlpiri.
    def warlpiri? = _nii_locale&.subset_of?('wbp')

    # @return [true, false] whether or not the language is Washo.
    def washo? = _nii_locale&.subset_of?('was')

    # @return [true, false] whether or not the language is Wayuu.
    def wayuu? = _nii_locale&.subset_of?('guc')

    # @return [true, false] whether or not the language is Welsh.
    def welsh? = _nii_locale&.subset_of?('cy')

    # @return [true, false] whether or not the language is West Flemish.
    def west_flemish? = _nii_locale&.subset_of?('vls')

    # @return [true, false] whether or not the language is Western Balochi.
    def western_balochi? = _nii_locale&.subset_of?('bgn')

    # @return [true, false] whether or not the language is Western Frisian.
    def western_frisian? = _nii_locale&.subset_of?('fy')

    # @return [true, false] whether or not the language is Western Mari.
    def western_mari? = _nii_locale&.subset_of?('mrj')

    # @return [true, false] whether or not the language is Wolaytta.
    def wolaytta? = _nii_locale&.subset_of?('wal')

    # @return [true, false] whether or not the language is Wolof.
    def wolof? = _nii_locale&.subset_of?('wo')

    # @return [true, false] whether or not the language is Wu Chinese.
    def wu_chinese? = _nii_locale&.subset_of?('wuu')

    # @return [true, false] whether or not the language is Xhosa.
    def xhosa? = _nii_locale&.subset_of?('xh')

    # @return [true, false] whether or not the language is Xiang Chinese.
    def xiang_chinese? = _nii_locale&.subset_of?('hsn')

    # @return [true, false] whether or not the language is Yangben.
    def yangben? = _nii_locale&.subset_of?('yav')

    # @return [true, false] whether or not the language is Yao.
    def yao? = _nii_locale&.subset_of?('yao')

    # @return [true, false] whether or not the language is Yapese.
    def yapese? = _nii_locale&.subset_of?('yap')

    # @return [true, false] whether or not the language is Yemba.
    def yemba? = _nii_locale&.subset_of?('ybb')

    # @return [true, false] whether or not the language is Yiddish.
    def yiddish? = _nii_locale&.subset_of?('yi')

    # @return [true, false] whether or not the language is Yoruba.
    def yoruba? = _nii_locale&.subset_of?('yo')

    # @return [true, false] whether or not the language is Zapotec.
    def zapotec? = _nii_locale&.subset_of?('zap')

    # @return [true, false] whether or not the language is Zarma.
    def zarma? = _nii_locale&.subset_of?('dje')

    # @return [true, false] whether or not the language is Zaza.
    def zaza? = _nii_locale&.subset_of?('zza')

    # @return [true, false] whether or not the language is Zeelandic.
    def zeelandic? = _nii_locale&.subset_of?('zea')

    # @return [true, false] whether or not the language is Zenaga.
    def zenaga? = _nii_locale&.subset_of?('zen')

    # @return [true, false] whether or not the language is Zhuang.
    def zhuang? = _nii_locale&.subset_of?('za')

    # @return [true, false] whether or not the language is Zoroastrian Dari.
    def zoroastrian_dari? = _nii_locale&.subset_of?('gbz')

    # @return [true, false] whether or not the language is Zulu.
    def zulu? = _nii_locale&.subset_of?('zu')

    # @return [true, false] whether or not the language is Zuni.
    def zuni? = _nii_locale&.subset_of?('zun')

    private

    def _nii_locale(base = self)
      case base
      when Nii::Context   then base.locale
      when Nii::Helpers   then base.nii(false)&.locale(true)
      when Nii::Locale    then base
      else
        return _nii_territory(base.to_nii_context)   if base.respond_to? :to_nii_context
        return _nii_territory(base.to_nii_locale)    if base.respond_to? :to_nii_locale
      end
    end
  end
end
