Data: I download 380 images of raccoons from Google images, 350 for training and 30 for validation. I wrote a Java program to download images with their urls. For test, I use cat.jpg, dog.jpg and raccoon.jpg.

Code:
Train : 
I changed "Dense(1)" to "Dense(3)", "sigmoid" to "softmax", "binary_crossentropy" to "categorical_crossentropy" and "binary" to "categorical".
model.add(Dense(3)) 
model.add(Activation('softmax'))

model.compile(loss='categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

train_generator = train_datagen.flow_from_directory(
    train_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical')

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical')

Classify:
I changed "Dense(1)" to "Dense(3)", "sigmoid" to "softmax", "binary_crossentropy" to "categorical_crossentropy". And I add a third test_image3. Also, I changed "print(result[0][0])" to "result = numpy.argmax(result) print(result)"

model.add(Activation('softmax'))
model.compile(loss='categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

myPic3 = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/live/raccoon.jpg'
test_image3= image.load_img(myPic3, target_size = (img_width, img_height)) 
test_image3 = image.img_to_array(test_image3)
test_image3 = test_image3.reshape(input_shape)
test_image3 = numpy.expand_dims(test_image3, axis = 0)
result = model.predict(test_image3,verbose=0)