class ScreensController < ApplicationController
	def index
	end

  def new
    header = {"accountid" => "test123","authtoken" => "dzaJNcHVOF"}
    res = Typhoeus::Request.post("https://api.screenleap.com/v1/screen-shares", headers: header)
    @json = JSON.parse(res.body)
     @view_url = @json['viewerUrl']
    render :js => "$('#index').remove();$('body').append('<a href= #{@view_url} target=\"_blank\">Click here to see screen</a>');"
  end

end
