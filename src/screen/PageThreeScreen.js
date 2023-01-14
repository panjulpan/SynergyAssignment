import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
} from 'react-native';
import React from 'react';

const PageThreeScreen = ({navigation}) => {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.contentContainer}>
        <Text style={styles.mainText}>This is the Third Page</Text>
        <TouchableOpacity onPress={() => navigation.navigate('Page 4')}>
          <Text style={styles.buttonText}>Go the Next Page</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

export default PageThreeScreen;

const styles = StyleSheet.create({
  container: {
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
  },
  buttonText: {
    color: '#3366CC',
  },
});
