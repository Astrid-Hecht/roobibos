
module Api
  class V1Controller < ApplicationController
    def render_id_not_found
      render json: ErrorSerializer.new(Error.new('Object with matching id not found', 'NOT FOUND', 404)).serialized_json, status: :not_found
      false
    end

    def render_bad_request
      render json: ErrorSerializer.new(Error.new('Missing or invalid item paramters', 'BAD REQUEST', 400)).serialized_json, status: :bad_request
      false
    end

    # def render_empty_list
    #   render json: ErrorSerializer.new(Error.new('No results found', 'OK', 200), :find_one).serialized_json, status: 200
    #   false
    # end
  end
end