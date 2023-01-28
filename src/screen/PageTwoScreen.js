import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  ImageBackground,
} from 'react-native';
import React from 'react';

const PageOneScreen = ({navigation}) => {
  return (
    <SafeAreaView style={styles.container}>
      <ImageBackground
        source={require('../../assets/images/mars.jpeg')}
        resizeMode="cover"
        style={styles.imageBackground}>
        <View style={styles.contentContainer}>
          <Text style={styles.mainText}>You are in a Mars Planet</Text>
          <TouchableOpacity
            onPress={() => navigation.navigate('Jupiter')}
            style={styles.button}>
            <Text style={styles.buttonText}>Go the Next Planet</Text>
          </TouchableOpacity>
        </View>
      </ImageBackground>
    </SafeAreaView>
  );
};

export default PageOneScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  imageBackground: {
    flex: 1,
    justifyContent: 'center',
  },
  contentContainer: {
    alignSelf: 'center',
    alignItems: 'center',
  },
  mainText: {
    fontSize: 18,
    marginBottom: 10,
    fontWeight: '600',
    color: 'white',
  },
  button: {
    backgroundColor: '#FFFFFF',
    padding: 10,
    borderRadius: 10,
  },
  buttonText: {
    color: '#3366CC',
  },
});
