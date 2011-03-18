fickle
======
*Don't make up your mind.*

Fickle is a feature engine for Rails 3. It is currently under heavy development and
is not stable in any sense of the word. Especially not the emotional sense.

Unlike other solutions, fickle lets you manage your features without __opening a file__,
__committing to a repository__, __performing a deploy__, or __breaking out ssh__. Just
point a browser at your application and bend it to your will!

Not only that, but fickle allows you to override your global features by mixing feature-set
functionality into __any model in your application__. If you want to restrict some experimental
features to a group of beta testers, it's easy to implement. If you want to enable every
feature when you're logged in as, say, "guinea_pig," you got it. 

Quickstart
----------

1.  Add fickle to your Gemfile
  
        gem 'fickle'
    
2.  Run the generator

      > ./script/rails generate fickle:install
    
3.  Add feature switches
    
        <%- if feature_enabled? :my_totally_sweet_feature %>
          <!--
            My totally sweet code
          -->
        <%- else %>
          <!--
            My slightly less sweet code
          -->
        <%- end %>


4.  Administer!

    ![Fickle Administrative Panel](http://i.imgur.com/Kiamq.png "http://localhost:3000/features")
    
Web Interface
-------------

Fickle includes a web interface for managing your features. You can globally turn features on and off,
and you can manage them on a model-by-model basis. You can even hardstop a feature if it starts causing
you trouble.

The `fickle:install` generator adds this line to your `config/routes.rb` file:

    fickle_admin 'features'
    
You can change this line for more advanced control, or you can remove it altogether if you don't want
to use the web interface.

The following options are currently supported:

    path         - the first argument, where the fickle admin panel should live.
    :restrict_on - symbol which refers to a method in ApplicationController for
                   access restriction (ex. :current_user). If provided, fickle
                   will return a 404 unless the result of this method call returns
                   true for "can_administer_fickle?"
    :controller  - The controller to use. If you would like to override fickle's
                   behavior, you can subclass "Fickle::FeaturesController" with
                   your own controller and provide the name here.


Advanced Features
-----------------

Let's say you want to limit features on a per-user basis.

### app/models/user.rb

    class User < ActiveRecord::Base
      
      has_feature_set
      
    end
    
### app/controllers/experimental_controller.rb

    class ExperimentalController
    
      before_filter :authenticate
      
      def secret_feature
        status 404 and return unless current_user.has_feature? :my_secret_new_feature
        # Do secret stuff
      end
    
    end

You can also access this method in the views. Cause, you know, it's on the model.

Tips/tricks
-----------


Want a user who gets all the goodies? It's ruby!

### app/models/user.rb

    def has_feature?(feature)
      admin? || super
    end

Oh, snap that was easy.


    Copyright (c) 2011 chrisrhoden && lazerclub industries

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.