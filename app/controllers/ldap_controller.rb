require 'net/ldap'
class LdapController < ApplicationController
    include Devise::Controllers::Helpers

    def connect
        ldap = Net::LDAP.new(
            host: '192.168.0.17',#'35.234.173.101',
            port: 389,
            auth: {
                method: :simple,
                dn: "cn=admin,dc=mediun",
                password: "admin"
            }
        )
        return ldap.bind
    end

    def create
        puts("1. Summoning the dark lord")
        email = params[:email]
        password = params[:password]
        email = email[/\A\w+/].downcase
        puts(email)
        puts("2. conjuring...")
        if connect()
            puts("3. summoned!")
            ldap = Net::LDAP.new(
                host: '192.168.0.17',#'35.234.173.101',
                port: 389,
                auth: {
                    method: :simple,
                    dn: "cn=" + email + "@unal.edu.co, ou=mediun,dc=mediun",
                    password: password
                }
            )
            if ldap.bind

                query = "select * from users where email LIKE '" + email + "@unal.edu.co'"
                puts(query)
                results = ActiveRecord::Base.connection.exec_query(query)
                if results.present?
                    @newAuth = ObjAuth.new(email, password, "true")
                    puts("Autenticación satisfactoria.")
                    #sign_in_and_redirect("sign_in", params)
                    #sign_in(User.find(2), scope: :user)
                    render json: @newAuth no sign_in
                else
                    puts("Autenticación no satisfactoria, el usuario no se encuentra registrado en la base de datos.")
                    @newAuth = ObjAuth.new(email, password, "false")
                    render json: @newAuth
                end
            else
                puts("Autenticación no satisfactoria, el usuario no se encuentra registrado en el LDAP.")
                @newAuth = ObjAuth.new(email, password, "false")
                render json: @newAuth
            end
        end
    end
end

class ObjAuth
    def initialize(email, password, answer)
        @email = email
        @password = password
        @answer = answer
    end
end
