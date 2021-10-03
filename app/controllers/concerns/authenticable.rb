module Authenticable 
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']
    # ||= se ja possui um valor, retorne o valor caso contrario atribua o valor

    unless valid_token?
      render  json: { errors: "Insira um token" },
              status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end