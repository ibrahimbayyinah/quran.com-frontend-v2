class VersesController < ApplicationController
  before_action :init_presenter

  def share
    render layout: false
  end

  def select_tafsirs
    @approved_tafsirs = ResourceContent.tafsirs.approved
    @tafsirs_langs = @approved_tafsirs.pluck(:language_name).uniq

    render layout: false
  end

  def tafsir
  end

  protected

  def init_presenter
    @presenter = VersePresenter.new(self)

    unless @presenter.verse
      redirect_to '/', alert: t('errors.invalid_verse')
    end
  end
end
